// page.hpp — cpp 코드를 reverse engineer해서 만든 stub.
// 강의에서 제공된 실제 헤더와는 다를 수 있음 (특히 PAGE_SIZE, LEAF 상수 값).
#ifndef PAGE_HPP
#define PAGE_HPP
#include <cstdint>
#include <cstdlib>
#include <cstdio>

#define PAGE_SIZE 4096
#define LEAF 0
#define INTERNAL 1

class slot_header {
private:
    uint32_t num_data;
    uint16_t data_region_off;
    void *offset_array;
    uint16_t page_type;
public:
    void set_num_data(uint32_t n) { num_data = n; }
    uint32_t get_num_data() { return num_data; }
    void set_data_region_off(uint16_t o) { data_region_off = o; }
    uint16_t get_data_region_off() { return data_region_off; }
    void set_offset_array(void *a) { offset_array = a; }
    void* get_offset_array() { return offset_array; }
    void set_page_type(uint16_t t) { page_type = t; }
    uint16_t get_page_type() { return page_type; }
};

class page {
public:
    slot_header hdr;
    page *leftmost_ptr;
    page(uint16_t type);
    uint16_t get_type();
    uint16_t get_record_size(void *record);
    char *get_key(void *record);
    uint64_t get_val(void *key);
    void set_leftmost_ptr(page *p);
    page *get_leftmost_ptr();
    uint64_t find(char *key);
    bool insert(char *key, uint64_t val);
    page* split(char *key, uint64_t val, char** parent_key);
    bool is_full(uint64_t inserted_record_size);
    void defrag();
    void print();
};
#endif
