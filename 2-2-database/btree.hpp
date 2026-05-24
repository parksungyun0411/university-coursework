// btree.hpp — cpp 코드를 reverse engineer해서 만든 stub.
// 강의에서 제공된 실제 헤더와 다를 수 있음.
#ifndef BTREE_HPP
#define BTREE_HPP
#include <cstdint>
#include "page.hpp"

class btree {
public:
    page *root;
    int height;
    btree();
    void insert(char *key, uint64_t val);
    uint64_t lookup(char *key);
};
#endif
