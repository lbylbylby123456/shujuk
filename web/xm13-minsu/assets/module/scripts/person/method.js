﻿
/*根据id获取对象*/
function $(str) {
    return document.getElementById(str);
}
 
//var addrShow = $('addr-show');
//var btn = document.getElementsByClassName('met1')[0];
var s1 = $('s1');
var s2 = $('s2');
var s3 = $('s3');
var prov = $('prov');
var city = $('city');
var country = $('country');
 
 
/*用于保存当前所选的省市区*/
var current = {
    prov: '',
    city: '',
    country: ''
};
 
/*自动加载省份列表*/
(function showProv() {
   // btn.disabled = true;
    var len = provice.length;
    for (var i = 0; i < len; i++) {
        var provOpt = document.createElement('option');
        provOpt.innerText = provice[i]['name'];
        provOpt.value = i;
        prov.appendChild(provOpt);
    }
})();
 
/*根据所选的省份来显示城市列表*/
function showCity(obj) {
    var val = obj.options[obj.selectedIndex].value;
    if (val != current.prov) {
        current.prov = val;
       // addrShow.value = '';
       // s1.value = '';
       // s2.value = '';
       // s3.value = '';
      //  btn.disabled = true;
    }
   // console.log(val);
    if (val != null) {
        city.length = 1;
        var cityLen = provice[val]["city"].length;
        for (var j = 0; j < cityLen; j++) {
            var cityOpt = document.createElement('option');
            cityOpt.innerText = provice[val]["city"][j].name;
            cityOpt.value = j;
            city.appendChild(cityOpt);
        }
    }
}
 
/*根据所选的城市来显示县区列表*/
function showCountry(obj) {
    var val = obj.options[obj.selectedIndex].value;
    current.city = val;
    if (val != null) {
        country.length = 1; //清空之前的内容只留第一个默认选项
        var countryLen = provice[current.prov]["city"][val].districtAndCounty.length;
        if (countryLen == 0) {
            addrShow.value = provice[current.prov].name + '-' + provice[current.prov]["city"][current.city].name;
            return;
        }
        for (var n = 0; n < countryLen; n++) {
            var countryOpt = document.createElement('option');
            countryOpt.innerText = provice[current.prov]["city"][val].districtAndCounty[n];
            countryOpt.value = n;
            country.appendChild(countryOpt);
        }
    }
    s1.value = provice[current.prov].name;
    s2.value = provice[current.prov]["city"][current.city].name;
    s3.value = provice[current.prov]["city"][current.city].districtAndCounty[current.country];
}


function addInfo(obj){
    current.country = obj.options[obj.selectedIndex].value;
    s1.value = provice[current.prov].name;
    s2.value = provice[current.prov]["city"][current.city].name;
    s3.value = provice[current.prov]["city"][current.city].districtAndCounty[current.country];
}