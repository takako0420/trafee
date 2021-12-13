const group = document.getElementsByClassName("btn-group");
const btn = document.getElementsByName('check');
const form = document.getElementsByClassName('chose');

//ボタンの順番を取得
for (let i = btn.length - 1 ; i >= 0 ; i--){
  let btnNum = (i + 4) % 4;
  btnSet(btnNum)
  btn[i].addEventListener("click", function(){
  //アクティブ判定
  if(btn[i].classList.contains('active') === true){ 
    changeActive(i,btnNum);
  }else{
    score(0,btnNum);
    divideCount(0,btnNum);
  }
})};

//フォーム初期値０
function btnSet(btnNum){
  let n = 0;
  while (n <= btnNum){
    form[n].value = 0;
    n++;
  }
};

//グループ内アクティブを非アクティブに切り替え
function changeActive (i,btnNum){
  //行番号
  let rowNum = Math.ceil(( i + 5 ) / 4 - 2);
  //クリックしたボタンの順序

  score(1,btnNum);
  divideCount(1,btnNum);
  //クリックしたボタンは削除対象から除外
  let searchActive = [0, 1, 2, 3];
  searchActive.splice(btnNum, 1);
  //アクティブを非アクティブに切り替え
  let c = 0;
  while (c < 3){
    searchActive.forEach( e => {
      let target = group[rowNum].children[e].classList;
      if(target.contains('active') === true){ 
        target.remove('active');
        score(0,e);
        divideCount(0,e);
      }
    })
    c++
  }
};

//合計点振り分け
const checkPoint = 100 / btn.length;
let numValue = 0;

function score(x,count){
  if (x === 1){
    numValue = numValue + ((count + 1) * checkPoint);
    outPut(numValue);
  } else if (x === 0){
    numValue = numValue - ((count + 1) * checkPoint);
    outPut(numValue);
  }
};

//合計点出力
function outPut(numValue){
  document.getElementById('sum').innerHTML = Math.round(numValue);
};

//フォームのカウント初期値
let c_one = 0;
let c_two = 0;
let c_three = 0;
let c_four = 0;

//フォーム振り分け
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
  }
};

//フォームに出力
function minNum (sumCount,btnNum){
  form[btnNum].value = sumCount;
};