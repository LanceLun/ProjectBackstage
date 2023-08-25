
$(document).ready(function () {
    Index();
})
//查詢全部
function Index() {


    let url = '/Speaker/Indexajax'

    axios({
        url: url,
        method: 'get'
    }).then(res => {
        //let data = JSON.stringify(res.data[0])
        
       
        //console.log(data)
        htmlMaker(res.data);
    })
};

////新增
function create() {
    let createSpeakerInfo = document.querySelector("#createSpeaker");

    var formData = new FormData(createSpeakerInfo);
    console.log(JSON.stringify(formData));


    //得到值
    //var speakerName = document.querySelector("#SpeakerName").value;
    //var speakerPhone = document.querySelector("#SpeakerPhone").value;
    //var speakerFieldId = document.querySelector("#fk_SpeakerFieldId").value;
    //var speakerImg = document.querySelector("#SpeakerImg").value;
    //var speakerBranchId = document.querySelector("#fk_SpeakerBranchId").value;
    //var speakerDescription = document.querySelector("#SpeakerDescription").value;


    let url = '/Speaker/Create'

    axios.post(url, formData)
        .then(res => {
            Index();
        })
   
};

function insert() {
    $('#SpeakerName').val("Yuan");
    $("#SpeakerPhone").val("0937652367")
    $("#fk_SpeakerFieldId").val(3)
    $("#fk_SpeakerBranchId").val(3)
    $("#SpeakerDescription").val("登山專家Yuan會帶領大家一起登山")
    
}

function htmlMaker(data) {
    let table = document.querySelector("#speakerBody");
    let html = "";
  


    for (let i = 0; i < data.length; i++)
            {
        html += `<tr>
                  <td class="sticky"><input class="form-check-input check-item" type="checkbox" data-id=""></td>
                    <td>
                        ${data[i].SpeakerId}
                    </td>

                    <td>
                         ${data[i].SpeakerName}
                    </td>

                    <td>
                    <div>
                      
                    <img width=300px  src=" /Public/Img/講師大頭貼/${data[i].SpeakerImg}" data-bs-toggle="modal" data-bs-target="#speakerImgEdit" onclick="EditGetPhoto( ${data[i].SpeakerId})"/>
                   
                    </div >
                    </td>

                    <td>
                        ${data[i].FieldName}
                    </td>
                    <td>
                     <div class="manage-btn-container d-flex justify-content-center">
                            <button class="btn-edit me-1" data-bs-toggle="modal" data-bs-target="#speakerEdit" onclick="EditGetInfo(${data[i].SpeakerId})"><i class="bi bi-pencil-square"></i></button>
                            <button class="btn-view me-1" data-bs-toggle="modal" data-bs-target="#speakerDetail" onclick="GetDetail(${data[i].SpeakerId})"><i class="bi bi-clipboard-check"></i></button>
                            <button class="btn-del" onclick="Delete(${data[i].SpeakerId})"><i class="bi bi-trash-fill"></i></button>

                        </div>
                    </td>
                   
                </tr>`;
    };
  


    table.innerHTML = html;
   
    $('#cancel').click();
    

}

function EditGetInfo(SpeakerId) {
    console.log(SpeakerId)
    axios({
        url: '/Speaker/Edit',
        method: 'get',
        params: {
            "id": SpeakerId
        }
    }).then(res => {
        console.log(JSON.stringify(res.data));
        $('#EditSpeakerId').val(res.data.SpeakerId);
        $('#EditSpeakerName').val(res.data.SpeakerName);
        $("#EditSpeakerPhone").val(res.data.SpeakerPhone)
        $("#Editfk_SpeakerFieldId").val(res.data.fk_SpeakerFieldId)
        $("#Editfk_SpeakerBranchId").val(res.data.fk_SpeakerBranchId)
        $("#EditSpeakerDescription").val(res.data.SpeakerDescription)
    })
}

function Edit() {
    let editSpeakerInfo = document.querySelector("#editSpeaker");

    var formData = new FormData(editSpeakerInfo);

    axios.post('/Speaker/Edit', formData)
        .then(res => {
            Index();
            $('#cancelEdit').click();
        })
}

function EditGetPhoto(SpeakerId) {

    console.log(SpeakerId)

    axios({
        url: '/Speaker/EditPhoto',
        method: 'get',
        params: {"id":SpeakerId}
    }).then(res => {
        console.log(JSON.stringify(res.data));
        //$("#EditSpeakerImg").val(res.data.SpeakerImg)
        $("#EditImgSpeakerId").val(res.data.SpeakerId)
    })

}


function EditPhoto(){
    let editSpeakerPhoto = document.querySelector("#editSpeakerImgForm");

    var formData = new FormData(editSpeakerPhoto);

    axios.post('/Speaker/EditPhoto', formData)
        .then(res => {
            Index();
            $('#cancelEditImg').click();
        })
}

function Delete(SpeakerId) {

  /*  console.log(SpeakerId)*/
    axios({
        url: '/Speaker/Delete',
        method: 'post',
        params: { "id": SpeakerId }
        
    }).then(res => {
        console.log(JSON.stringify(res.data));
        Index();
    })

}

function GetDetail(SpeakerId) {
    axios({
        url: '/Speaker/Details',
        method: 'get',
        params: { 'id': SpeakerId }
    }).then(res => { 
        console.log(JSON.stringify(res.data));
        $("#DetailSpeakerId").val(res.data.SpeakerId);
        $("#DetailSpeakerName").val(res.data.SpeakerName);
        $("#DetailSpeakerImg").attr('src', "/Public/Img/講師大頭貼/" + res.data.SpeakerImg);
        $("#DetailSpeakerPhone").val(res.data.SpeakerPhone);
        $("#DetailSpeakerField").val(res.data.FieldName);
        $("#Detailfk_SpeakerBranchId").val(res.data.BranchName);
        $("#DetailSpeakerDescription").val(res.data.SpeakerDescription);

    }
    )

}



                     