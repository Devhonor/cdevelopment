***
#先决条件(requirements)

无(None)

***
#使用说明(using manual)
-  这是当前最新版本的 c 语言 Linux 开发环境，主要更新了gcc g++ cmake make 等程序
-  This is the latest version of the C language Linux development environment, which mainly updates programs such as GCC, G++, CMake, and Make.

#使用步骤(using steps) </br>

1.下载包到任意目录
受限于网络，推荐使用 gitee 进行下载
```
[root@server opt]# git clone https://gitee.com/developerhonor/cdevelopment.git

```

</br>

2.执行部署

```
[root@server opt]# cd cdevelopment/bin/
[root@server bin]# sh deploye.sh 
[2025-01-18 AM 02:33:39]  Uncompress package to /usr/ directory 
[2025-01-18 AM 02:33:39]  Adding LD_LIBRARY_PATH to .bashrc 
[2025-01-18 AM 02:33:39]  Reloading environment information 
[2025-01-18 AM 02:33:39]  Output result: 
[2025-01-18 AM 02:33:39]        gcc version is latest: 14.2.0
[2025-01-18 AM 02:33:39]        g++ version is latest: 14.2.0
[2025-01-18 AM 02:33:39]        cmake version is latest: 3.31.4
[2025-01-18 AM 02:33:39]        cmake version is latest: 4.4
```

</br>

3.验证编译器

```
[root@server ~]# mkdir -p cdeve/
[root@server ~]# cd cdeve/
[root@server cdeve]# cat n_sum.h
#ifndef N_SUM_H
#define N_SUM_H

int n_sum(int var_start,int var_end);

#endif

[root@server cdeve]# cat n_sum.c
#include "n_sum.h"
int n_sum(int var_start,int var_end)
{
        int sum = 0;
        sum = ((var_start + var_end) * var_end) / 2;
        return sum;
}
[root@server cdeve]# cat main.c
#include <stdio.h>
#include "n_sum.h"

int main()
{
        int sum = 0;
        int     var_start = 1;
        int     var_end = 100;
        sum = n_sum(var_start,var_end);
        printf("从 %d 到 %d 的前 %d 项和为 %d \n",var_start,var_end,var_end,sum);
        return 0;
}

[root@server cdeve]# gcc main.c n_sum.c -o n_sum
[root@server cdeve]# ./n_sum 
从 1 到 100 的前 100 项和为 5050 

```


