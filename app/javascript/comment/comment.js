const comment = document.getElementById('comment');
const lastFeedback = document.getElementById('last_feedback');
const lastTarget = document.getElementById('last_target');

function matchComments(){
  const lastSheetId = gon.documents[gon.documents.length -1]["sheet_id"];
  const resultDocuments = gon.documents.filter((document) => document.sheet_id === lastSheetId);
  if (!sheetComment(resultDocuments)) {
    hiddenComment ();
  }
};

function sheetComment (resultDocuments){
  if(gon.comments.length === 0){
    return false;
  }else{
    for(let i = resultDocuments.length; i > 0; i--){
      const resultComment = gon.comments.find((comment) => comment.document_id === resultDocuments[i -1].id);
      if(resultComment){
        showComment (resultComment);
        return true;
      }
    }
  }
  return false;
};

function hiddenComment (){
  comment.style.display = "none";
};

function showComment (resultComment){
  lastFeedback.innerText = resultComment.feedback;
  lastTarget.innerText = resultComment.target;
};

if(gon.documents.length !== 0){window.addEventListener('load', matchComments())};