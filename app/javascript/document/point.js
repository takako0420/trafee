const selectBox = document.getElementById('select-main');
let group = document.getElementsByClassName("btn-group");
let btn = document.getElementsByName('check');
const form = document.getElementsByClassName('chose');
const tableWrap = document.getElementById('reset');

//テーブル監視
var observer = new MutationObserver(function(){
  formSet();
  outPut(0);
  divideCount(0,'reset');
  score('reset',0)
  btnSearch();
})

const config = { 
  childList: true
};

observer.observe(tableWrap, config);

//クリックイベント
function btnSearch(){
  for (let i = btn.length - 1 ; 0 <= i ; i--){
    let btnNum = (i + 4) % 4;

    btn[i].addEventListener("click", () => {
      if(btn[i].classList.contains('active')){ 
        changeActive(i,btnNum);
      }else{
        score(0,btnNum);
        divideCount(0,btnNum);
      }
    })
  }
}

//アクティブ切り替え
function changeActive (i,btnNum){
  score(1,btnNum);
  divideCount(1,btnNum);
  let rowNum = Math.ceil(( i + 5 ) / 4 - 2);
  let searchActive = [0, 1, 2, 3];
  searchActive.splice(btnNum, 1);
  let c = 0;
  while (c < 3){
    searchActive.forEach( e => {
      let target = group[rowNum].children[e].classList;
      if(target.contains('active')){ 
        target.remove('active');
        score(0,e);
        divideCount(0,e);
      }
    })
    c++
  }
}

//合計点
let numValue = 0;
function score(x,count){
  if (x === 1){
    numValue = numValue + ((count + 1) * (100 / btn.length));
    outPut(numValue);
  } else if (x === 0){
    numValue = numValue - ((count + 1) * (100 / btn.length));
    outPut(numValue);
  } else if (x === 'reset'){
    numValue = count;
  }
}

function outPut(numValue){
  document.getElementById('sum').textContent = Math.round(numValue);
}

//フォーム
function formSet(){
  let n = 0;
  while (n < 4){
    form[n].value = 0;
    n++;
  }
}

let c_one = 0;
let c_two = 0;
let c_three = 0;
let c_four = 0;

function divideCount(x,btnNum){
  switch (btnNum){
    case 0:
      (x===1)?c_one++:c_one--;
      minNum(c_one,btnNum);
      break;
    case 1:
      (x===1)?c_two++:c_two--;
      minNum(c_two,btnNum);
      break;
    case 2:
      (x===1)?c_three++:c_three--;
      minNum(c_three,btnNum);
      break;
    case 3:
      (x===1)?c_four++:c_four--;
      minNum(c_four,btnNum);
      break;
    case 'reset':
      c_one = x, c_two = x, c_three = x, c_four = x;
      break;
  }
}

function minNum (count,btnNum){
  form[btnNum].value = count;
}