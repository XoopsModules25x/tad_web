<script type="text/javascript" src="<{$xoops_url}>/modules/tadtools/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        <{if $ActionID}>
            <{if $gphoto_link==""}>
                $("#gphoto_link").hide();
                $("#upload_photo").show();
            <{else}>
                $("#gphoto_link").show();
                $("#upload_photo").hide();
            <{/if}>
        <{else}>
            $("input[name='upload_method']").change(function(event) {
                var up_method = $("input[name='upload_method']:checked").val();
                if(up_method=="gphoto_link"){
                    $("#gphoto_link").show();
                    $("#upload_photo").hide();
                }else{
                    $("#gphoto_link").hide();
                    $("#upload_photo").show();
                }
            });
        <{/if}>
    });
</script>

<h2><{$smarty.const._MD_TCW_ACTION_ADD}></h2>
<div class="my-border">
    <form action="action.php" method="post" id="myForm" enctype="multipart/form-data" role="form" class="form-horizontal">

        <!--分類-->
        <div class="form-group row">
            <div class="col-md-12">
                <{$cate_menu_form}>
            </div>
        </div>

        <!--活動名稱-->
        <div class="form-group row">
            <div class="col-md-12">
                <input type="text" name="ActionName" value="<{$ActionName}>" id="ActionName" class="validate[required] form-control" placeholder="<{$smarty.const._MD_TCW_ACTIONNAME}>">
            </div>
        </div>


        <!--活動說明-->
        <div class="form-group row">
            <div class="col-md-12">
                <textarea name="ActionDesc"  rows=4 id="ActionDesc"  class="form-control" placeholder="<{$smarty.const._MD_TCW_ACTIONDESC}>"><{$ActionDesc}></textarea>
            </div>
        </div>


        <!--活動日期-->
        <div class="form-group row">
            <label class="col-md-2 col-form-label text-sm-right control-label">
                <{$smarty.const._MD_TCW_ACTIONDATE}>
            </label>
            <div class="col-md-4">
                <input type="text" name="ActionDate" class="form-control" value="<{$ActionDate}>" id="ActionDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd' , startDate:'%y-%M-%d'})">
            </div>
            <!--活動地點-->
            <label class="col-md-2 col-form-label text-sm-right control-label">
                <{$smarty.const._MD_TCW_ACTIONPLACE}>
            </label>
            <div class="col-md-4">
                <input type="text" name="ActionPlace" class="form-control" value="<{$ActionPlace}>" id="ActionPlace" >
            </div>
        </div>

        <{if $ActionID==""}>
            <div class="form-group row">
                <label class="col-md-2 col-form-label text-sm-right control-label">
                    <{$smarty.const._MD_TCW_ACTION_UPLOAD_METHOD}>
                </label>
                <div class="col-md-4">
                    <div class="form-check form-check-inline radio-inline">
                        <label class="form-check-label" for="radio_upload_photo">
                            <input class="form-check-input" type="radio" name="upload_method" id="radio_upload_photo" value="upload_photo" class="validate[required]" <{if $upload_method!='gphoto_link'}>checked<{/if}>>
                            <{$smarty.const._MD_TCW_ACTION_UPLOAD}>
                        </label>
                    </div>
                    <div class="form-check form-check-inline radio-inline">
                        <label class="form-check-label" for="radio_gphoto_link">
                            <input class="form-check-input" type="radio" name="upload_method" id="radio_gphoto_link" value="gphoto_link" class="validate[required]" <{if $upload_method=='gphoto_link'}>checked<{/if}>>
                            <{$smarty.const._MD_TCW_ACTION_GPHOTO}>
                        </label>
                    </div>
                </div>
            </div>
        <{else}>
            <{if $gphoto_link==""}>
                <input type="hidden" name="upload_method" value="upload_photo">
            <{else}>
                <input type="hidden" name="upload_method" value="gphoto_link">
            <{/if}>
        <{/if}>

        <!--上傳圖檔-->
        <div id="upload_photo">
            <div class="form-group row">
                <label class="col-md-2 col-form-label text-sm-right control-label">
                    <{$smarty.const._MD_TCW_ACTION_UPLOAD}>
                </label>
                <div class="col-md-8">
                    <{$upform}>
                </div>
            </div>
            <{$list_del_file}>
        </div>

        <div id="gphoto_link" style="display: none;">
            <div class="form-group row">
                <label class="col-md-2 col-form-label text-sm-right control-label">
                    <{$smarty.const._MD_TCW_ACTION_GPHOTO_URL}>
                </label>
                <div class="col-md-10">
                    <input type="text" name="gphoto_link" class="form-control validate[required , custom[url]]" value="<{$file_link}>" placeholder="<{$smarty.const._MD_TCW_ACTION_GPHOTO_URL_DEMO}>">
                </div>
            </div>

            <div class="alert alert-info">
                <{$smarty.const._MD_TCW_ACTION_GPHOTO_URL_HEPL}>
            </div>
        </div>


        <div class="form-group row">
            <div class="col-md-12">
                <{$power_form}>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-12">
                <{$tags_form}>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-12 text-center">
                <!--活動編號-->
                <input type="hidden" name="ActionID" value="<{$ActionID}>">
                <!--所屬團隊-->
                <input type="hidden" name="WebID" value="<{$WebID}>">
                <input type="hidden" name="op" value="<{$next_op}>">
                <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
            </div>
        </div>
    </form>
</div>