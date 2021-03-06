
// This file is a part of the Ornus project.
// https://github.com/Apostolos-Delis/Ornus/

// Copyright (c) 2018 Apostolos Delis
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

pragma solidity ^0.4.11;


contract DividendSplit {
    address public creator;
    mapping(uint => address) public shareholders;
	
    event Disburse(uint _amount, uint _numShareholders);
	
    function RevenueShare(addresses[]){
        creator = msg.sender;
        numShareholders = addresses.length;
		
        for (uint i = 0; i < numShareholders; i++){    
            shareholders[i] = addresses[i];
        }
    }

    function shareDividends() returns (bool success) {
        uint amount = msg.value / numShareholders;
	
        for (uint i = 0; i < numShareholders; i++){
            if (!shareholders[i].send(amount)) throw;
        }
		
        Disburse(msg.value, numShareholders);
	
        return true;
    }
	
    function kill() {
        if (msg.sender == creator) suicide(creator)
    }
}
