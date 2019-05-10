//
//  main.m
//  算法
//
//  Created by laiyp on 2018/8/16.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
//1.给定三个整数，在不使用条件语句，和三目运算符的情况下，算出最大，最小
//运用布尔表达式的短路原理，x&&y，只有当x为真的时候，才会执行y
int maximum1(int a,int b,int c)
{
    int max = a;
    (max<b)&&(max=b);
    (max<c)&&(max=c);
    return max;
}
int minmum1(int a, int b, int c){
    
    int min = a;
    (min>b)&&(min = b);
    (min>c)&&(min=c);
    return min;
}
//运用数组
int maximum2(int a,int b,int c){
    int arr0[] = {a,b};
    int arr1[] = {arr0[a<b],c};
    return arr1[arr1[0]<c];
}
int minmum2(int a, int b, int c){
    int arr0[] = {a,b};
    int arr1[] = {arr0[a>b],c};
    return arr1[arr1[0]>c];
}

//2. 不使用加号运算符，求两个数的大小
int add1(int a,int b){
    return a-(-b);
}
int add2(int a,int b){
    while (a>0) {
        b++;
        a--;
    }
    while (a<0) {
        b--;
        a++;
    }
    return b;
}
int add3(int a, int b){
//    利用星号（*）将宽度精度传递给printf（）
    return printf("%*s%*s",a,"",b,"");
}
int add4(int a, int b){//半加法逻辑
    if (!b) {
        return a;
    }
    int sum = a ^ b;//异或
    int carry = (a&b)<<1;//与
    return add4(sum, carry);
}

//3.给定两个数相乘，不能用乘号或者循环
//解法：递归，a*b = a+a+a+a+...（b个a）
int mul(int a, int b){
    if (a == 0 || b == 0)
        return 0;
    if (b == 1)
        return a;
    if (a == 1)
        return b;
    return a + mul(a, b - 1);
}
int mult(int a,int b){
    int m = mul(a, abs(b));
    return (b<0)?(-m):m;
}

int mult2 (int a,int b){
    return b != 0 ? a/(1.0/b):0;
}

//4.不使用乘法和除法的情况下，怎么找到一个数的平方
// a^2 = a*a  a个a相加
int findSquare(int a){
    a = abs(a);
   int sqr = a;
    for (int i = 0; i<a-1; i++) {
        sqr = sqr + a;
    }
    return sqr;
}
// 4^2 = 1+3+5+7 数m的平方等于m个奇数相加
int findSquare2(int a){
    a = abs(a);
   int b = 1;
   int sqr = 0;
    for (int i = 0; i<a; i++) {
        sqr = sqr + b;
        b = b + 2;
    }
    return sqr;
}

//5.不使用任何条件语句查找数字是奇数还是偶数
char *judgeParity(int a){
    
    return (a&1)?("odd"):("even");
}
char *judgeParity2(int a){
    return (a%2)?("odd"):("even");
}
char *judgeParity3(int a){
    char *str[] = {"odd","even"};
    return str[a%2];
}

//不使用除法，执行两个数的除法
//乘法可以用加法，除法就用减法。x/y 让x一直减y，当余数小于y的时候，减的次数就是商
int divide(int a,int b){
    if(b == 0){
        NSLog(@"error");
        exit(1);
    }
//   判断符号
    int sign = 1;
    if (a*b<1) {
        sign = -1;
    }
    int number = 0;
    int x = abs(a);
    int y = abs(b);
    while (x >= y) {
        x = x - y;
        number++;
    }
    NSLog(@"remainder is %d",x);
    return sign * number;
}

//生成0和1，两个分e别是75%和25%的概率。生成0和1的函数分别是50%的概率
int randon(){//生成0和1，分别是50%的概率
    int rando = rand();
    return (rando%2);
}
int geneter(){
    int x = randon();// x 是{0,1}
    int y = randon();// y 是{0,1}
    return !(x|y);// x&y 是{0,0,0,1}
}

//指定和概率返回0，1和2 生成的概率一样
//生成0和1的概率是50% 50%，
int geneter1()
{
    int x = randon();
    int y = randon();
//    return (x + y);//(这样生成的就是，0和1和2)但是这样0和2的概率是25% 1和概率是50%
//    降低1生成的概率
    return (x == 1 && y == 0)?geneter1():(x+y);
}

//使用指定函数生成1-5之后，然后生成1-7的随机数，概率相同。1-5概率相同，1-7概率相同
int randomFive(){
    return ((rand()%5)+1);//生成1-5；
}
// 5*（random（）-1）+ random；生成的数是1-25，我们派除8-25就行
int randomSeven(){
    int r;
    do{
        r = 5*(randomFive() - 1) + randomFive();
    }while (r>7) ;
    return r;
}

//不使用条件语句的情况下实现三木运算符
int ternary(int x,int a, int b){
    return x*a+!x*b;//x是真，返回a，x是假，返回b
}
int ternary1(int x,int a, int b){
    int count[] = {b,a};
    return count[x];//x是真，返回a，x是假，返回b
}
//使用短路
int ternary2(int x,int a, int b){
    int result;
    x && ((result = a)||!a) || (result = b);
    return result;
}

//不使用比较运算和三目运算，去计算两个数是否相等
//利用减法运算

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       
//        NSLog(@"%d--%d",maximum1(6, 3, 9),minmum1(6, 3, 9));
//        NSLog(@"%d--%d",maximum2(6, 3, 9),minmum2(6, 3, 9));
//        NSLog(@"%d",add2(-2, 1));
        
//        NSLog(@"%d",mult2(-3, -4));
//        NSLog(@"%d",findSquare2(-4));
//        NSLog(@"%s",judgeParity3(2));
//        NSLog(@"%d",divide(22, -7));
//        for (int i = 0; i<30; i++) {
//
//            NSLog(@"%d",geneter());
//        }
        
//        int x = 0,y=0,z=0;
//        for (int i=0; i<10000; i++) {
//            int val = geneter1();
//            (val == 0)? x++:((val == 1)?y++:z++);
//        }
//        NSLog(@"0--%f 1--%f 2--%ff",x/100.00,y/100.00,z/100.00);
//        2018-08-31 10:53:48.113707+0800 算法[3108:60186] 0--32.900000 1--32.520000 2--34.580000f
        
        int count[8];
        for (int i=0; i<10000; i++) {
            int val = randomSeven();
            count[val]++;
        }
        for (int i = 1; i<8; i++) {
            NSLog(@"%d--%.2f",i,count[i]/100.0);
        }
//        2018-08-31 11:14:41.837696+0800 算法[3574:70767] 1--14.75
//        2018-08-31 11:14:41.837892+0800 算法[3574:70767] 2--14.45
//        2018-08-31 11:14:41.837910+0800 算法[3574:70767] 3--14.48
//        2018-08-31 11:14:41.837926+0800 算法[3574:70767] 4--14.12
//        2018-08-31 11:14:41.837940+0800 算法[3574:70767] 5--14.43
//        2018-08-31 11:14:41.837955+0800 算法[3574:70767] 6--13.71
//        2018-08-31 11:14:41.837966+0800 算法[3574:70767] 7--14.06
    }
    return 0;
}
