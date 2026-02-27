// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(_val1,_val2,_amount){
	if (_val1 < _val2){
		_val1 += _amount;
		if(_val1 > _val2)
			return _val2;
	}else{
		_val1 -= _amount;
		if(_val1 < _val2)
			return _val2;
	}
	return _val1;
}