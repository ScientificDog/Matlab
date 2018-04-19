function goldendevide %黄金分割法

%输入初始点与搜索步长
a0=input('Enter the initial value: ');
h=input('Enter the step length: ');
e=input('Enter the accuracy: ');

%定义要求解的目标函数
    function y=goalfun(x)
        y=3*x^2-8*x+9;%x^4+6*x^3-2*x^2-7*x+4;x^2+exp(-x)
    end

%定义重复函数
    function repeat
        a1=a2;
        f1=f2;
        a2=a3;
        f2=f3;
        a3=a2+h;
        f3=goalfun(a3);
    end

a1=a0;
f1=goalfun(a1);
a2=a1+h;
f2=goalfun(a2);

if(f1>f2)
    a3=a2+h;
    f3=goalfun(a3);
    while(f3<=f2)
        h=2*h;
        repeat;
    end
else
    h=-h;
    a3=a1;
    f3=f1;
    repeat;
    while(f3<=f2)
        h=2*h;
        repeat;
    end
end
if(f3>f2)
    a1=a1;
    a3=a3;
end
%计算内点及其对应函数值
a2=a3-0.618*(a3-a1);
a4=a1+0.618*(a3-a1);
f2=goalfun(a2);
f4=goalfun(a4);

%未达到收敛精度要求时进行变量替换及区间收缩
while(abs(a3-a1)>e)
    if(f2>f4)
        a1=a2;
        a2=a4;
        f2=f4;
        a4=a1+0.618*(a3-a1);
        f4=goalfun(a4);
    else
        a3=a4;
        a4=a2;
        f4=f2;
        a2=a3-0.618*(a3-a1);
        f2=goalfun(a2);
    end     
end

%输出满足收敛精度的极小值点及其对应函数值
MinimalPoint=(a3+a1)/2;
MinimalValue=goalfun(MinimalPoint);
fprintf('The final answer is: minimalpoint = %f, minimalvalue = %f\n', MinimalPoint, MinimalValue);
end
