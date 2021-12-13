const s_Input = document.getElementById('select-main');
const s_Send = document.getElementById('form-select');
const changeText = document.getElementById('change');

//セレクトボックス連動
function valueChange(){
  let c_Num = s_Input.selectedIndex;
  if (c_Num != 0 ){
  s_Send.options[c_Num].selected = true;
  }
};

if(s_Input != null){s_Input.addEventListener('change', valueChange)};