// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator{
    uint public result;

    function add(uint value) external{
        result+=value;
    }

    function sub(uint value) external{
        result-=value;
    }

    function multi(uint value) external{
        result*=value;
    }

    function divide(uint value) external{
        result/=value;
    }

    function modulo(uint value) external{
        result%=value;
    }

    function square(uint value) external{
        result = value * value;
    }

    function cube(uint value) external{
        result = value * value * value;
    }

    function sqrt(uint value) external{
        if(value>3){
           result = value;
           uint x = value / 2 + 1;
           while(x<result){
            result = x;
            x = (value / x + x) / 2;
           }
         }else if (value !=0){
            result=1;
         }else 
         result=0;
    }

    function SeeResult() external view returns(uint){
        return result;
    }

}