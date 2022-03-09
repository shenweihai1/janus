#include "deptran/__dep__.h"
#include "bench/tpcc/workload.h"
#include "workload.h"
#include "iostream"

namespace janus {
char RW_BENCHMARK_TABLE[] = "history";

void RwWorkload::RegisterPrecedures() {
  RegP(RW_BENCHMARK_R_TXN, RW_BENCHMARK_R_TXN_0,
       {0, 1, 2, 3, 4}, // TODO i
       {}, // TODO o
       {}, // TODO c
       {TPCC_TB_HISTORY, {TPCC_VAR_H_KEY}}, // s
       DF_NO,
       PROC {
           mdb::MultiBlob buf(1);
           auto tbl = tx.GetTable(RW_BENCHMARK_TABLE);

           // 4 reads
           mdb::Row *roww;
           const int num_partitions = Config::GetConfig()->replica_groups_.size();
           int32_t a = cmd.input.at(0).get_i32() % num_partitions ;
           for (int i=0; i<4; ++i) {
               int32_t b = cmd.input.at(i + 1).get_i32() % num_partitions ;
               int32_t c = cmd.input.at(i + 1).get_i32() - (b-a) ;
               Value vc(c) ;
               buf[0] = vc.get_blob();
               roww = tx.Query(tbl, buf);
               tx.ReadColumn(roww,1, &output[i], TXN_BYPASS);
           }
           *res = SUCCESS;
       }
  );

  RegP(RW_BENCHMARK_W_TXN, RW_BENCHMARK_W_TXN_0,
       {0, 1, 2, 3, 4}, // TODO i
       {}, // TODO o
       {}, // TODO c
       {TPCC_TB_HISTORY, {TPCC_VAR_H_KEY}}, // s
       DF_REAL,
       PROC {
           mdb::MultiBlob buf(1);
           auto tbl = tx.GetTable(RW_BENCHMARK_TABLE);

           mdb::Row *roww;
           const int num_partitions = Config::GetConfig()->replica_groups_.size();
           int32_t a = cmd.input.at(0).get_i32() % num_partitions ;
           // 4 reads and 4 writes
           for (int i=0; i<4; ++i) {
               int32_t b = cmd.input.at(i + 1).get_i32() % num_partitions ;
               int32_t c = cmd.input.at(i + 1).get_i32() - (b-a) ;
               Value vc(c) ;
               buf[0] = vc.get_blob();
               roww = tx.Query(tbl, buf);
               tx.ReadColumn(roww,1, &output[i], TXN_BYPASS);

               output[i].set_i32(output[i].get_i32() + 1);
               tx.WriteColumn(roww, 1, output[i], TXN_DEFERRED);
           }

           *res = SUCCESS;
       }
  );
}

RwWorkload::RwWorkload(Config *config) : Workload(config) {
}

void RwWorkload::GetTxRequest(TxRequest* req, uint32_t cid) {
  req->n_try_ = n_try_;
  std::vector<double> weights = {txn_weights_["read"], txn_weights_["write"]};
  switch (RandomGenerator::weighted_select(weights)) {
    case 0: // read
      GenerateReadRequest(req, cid);
      break;
    case 1: // write
      GenerateWriteRequest(req, cid);
      break;
    default:
      verify(0);
  }
}

void RwWorkload::GenerateWriteRequest(
    TxRequest *req, uint32_t cid) {
  auto id = this->GetId(cid);
  req->tx_type_ = RW_BENCHMARK_W_TXN;
  req->input_ = {
      {0, Value((i32) id)},
      {1, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
      {2, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
      {3, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
      {4, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
  };
}

void RwWorkload::GenerateReadRequest(
    TxRequest *req, uint32_t cid) {
  auto id = GetId(cid);
  req->tx_type_ = RW_BENCHMARK_R_TXN;
  req->input_ = {
      {0, Value((i32) id)},
      {1, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
      {2, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
      {3, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
      {4, Value((i32) RandomGenerator::rand(100, 1000000 - 100))},
  };
}

int32_t RwWorkload::GetId(uint32_t cid) {
  int32_t id;
  if (fix_id_ == -1) {
    id = RandomGenerator::rand(0, rw_benchmark_para_.n_table_ - 1);
  } else {
    auto it = this->key_ids_.find(cid);
    if (it == key_ids_.end()) {
      id = fix_id_;
      id += (cid & 0xFFFFFFFF);
      id = (id<0) ? -1*id : id;
      id %= rw_benchmark_para_.n_table_;
      key_ids_[cid] = id;
      Log_info("coordinator %d using fixed id of %d", cid, id);
    } else {
      id = it->second;
    }
  }
  return id;
}
} // namespace janus

