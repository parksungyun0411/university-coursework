# 2-2 Database (2023-2)

DBMS 내부 구조 직접 구현 과제.

| 파일 | 내용 |
|------|------|
| `page.cpp` | Slotted Page Structure - 가변 길이 레코드 관리 |
| `btree.cpp` | B+Tree - 인덱스 구조 (삽입/검색/삭제) |

```bash
g++ -std=c++17 page.cpp -o page && ./page
g++ -std=c++17 btree.cpp -o btree && ./btree
```
