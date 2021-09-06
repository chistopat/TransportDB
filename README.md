#Транспортный справочник
###CPP17 + SOCI + MySQL + Docker

---
Хороший мануал 
https://dane-bulat.medium.com/working-with-databases-in-c-an-introduction-7d6a6a78ae66

####Make Docker
```
 docker build -t cpp_soci_env -f Dockerfile .
 docker run -d  --cap-add sys_ptrace -p 127.0.0.1:2223:22 --name soci cpp_soci_env:latest
 
 ssh chistopat@127.0.0.1 -p 2223
```