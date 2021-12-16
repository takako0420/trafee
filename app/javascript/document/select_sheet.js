const selectInput = document.getElementById('select-main');
const selectHidden = document.getElementById('form-select');
const tableText = document.getElementsByClassName('sheet-text');
const inputTable = document.getElementsByClassName('input-table');
const resetTable = document.getElementById('reset');
const selectZero = document.getElementById('select-except-zero');

function valueChange(){
  let c_Num = selectInput.selectedIndex;
  if (c_Num != 0){
    selectZero.style.display = "block";
    selectHidden.options[c_Num].selected = true;
    searchSheetId(c_Num);
  } else if (c_Num === 0){
    selectZero.style.display = "none";
  }
}

function searchSheetId(c_Num) {
  let i = 0, len = 0, itemCount = 0;
  for (i = 0, len = gon.items.length; i < len; i++) {
    if (gon.sheets[c_Num-1].id === gon.items[i].sheet_id) {
        addTableChange(itemCount, gon.items[i].text);
        itemCount++;
    }
  }
}

function addTableChange(count, text){
  if (count === 0){
    tableText[0].innerText = text;
  } else {
    cloneArea = inputTable[0].cloneNode(true);
    inputTable[inputTable.length - 1].after(cloneArea);
    tableText[tableText.length - 1].innerText = text;
  }
}

let defaultHTML;
function DefaultSave() {
  selectZero.style.display = "none";
	defaultHTML = resetTable.innerHTML;
}

function HTMLRestore() {
	resetTable.innerHTML = defaultHTML;
  valueChange();
}

window.addEventListener('load', DefaultSave);
if(selectInput != null){selectInput.addEventListener('change', HTMLRestore)};
