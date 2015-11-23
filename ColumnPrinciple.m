function [ x,det ] = ColumnPrinciple( A,B )
%列主元消去法 column principle Gaussian elimination 
%作者： 胡辰 v1ns0n
%该函数的输入变量是线性方程组的系数矩阵A和B,比如3阶的矩阵A=[1,2,3;4,5,6;7,8,9],3*1的向量B=[1;2;3]。
%输入的线性方程组可以为任何阶数，主要满足A是个n阶的方阵，B是个n*1的向量，否则线性方程组将无解或者有多解，该方法都无法应对。
%如果输入的方程组存在解时，则输出方程组的解x,是一个n*1的向量，和系数矩阵的行列式det。
%该函数会把列主元消去法的求解过程打印出来，以供查看。
%如果方程无解或者输入有误，则会有相关的提示信息输出。
n=length(B);
rc=size(A);
if n~=length(A)||rc(1)~=rc(2)%确定输入矩阵的阶数，判断其正确性
    fprintf('输入的系数矩阵有误，请检查其阶数是否相同！');
    det=0;
    x=0;
    return;
end
det=1;
for k=1:n-1%外循环，依次对每一列进行处理
    max_value=max(abs(A(k:n,k)));%选择最大的主元
    if max_value==0%如果一列中全为0，则行列式为0，方程无解或者多解，退出函数
        det=0;
        x=0;
        fprintf('该方程组的矩阵A的秩小于其阶数，有多个解或者无解，该函数无法给出其解！');
        return;
    end
    index=find(abs(A(:,k))==max_value);
    index=index(1);%找到最大的主元属于哪一行，如果有多行择选择靠上的行
    if index~=k
        A([k,index],:)=A([index,k],:);
        B([k,index])=B([index,k]);%交换两行
        det=-det;%交换两行，行列式取反
        disp(A);
        disp(B);
    end
    for i=k+1:n %内循环，对当前行下面的行进行消元处理
        A(i,k)=A(i,k)/A(k,k);
        for j=k+1:n
            A(i,j)=A(i,j)-A(i,k)*A(k,j);
        end
        B(i)=B(i)-A(i,k)*B(k);
    end
    det=A(k,k)*det;%行列式取对角线上元素的乘积
    disp(A);
    disp(B);
end
if A(n,n)==0
    det=0;
    x=0;
    fprintf('该方程组的矩阵A的秩小于其阶数，有多个解或者无解，该函数无法给出其解！');
    return;
end
B(n)=B(n)/A(n,n);
for i=n-1:-1:1 %开始回代求解
    B(i)=(B(i)-sum(A(i,i+1:n).*B(i+1:n)'))/A(i,i);
end
det=A(n,n)*det; %给返回值赋值
x=B;
end

