<{if $op=="edit_form"}>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#WorksKind').change(function() {
        var WorksKind=$('#WorksKind').val();
        if(WorksKind!=""){
          $('#works_date_label').html('<{$smarty.const._MD_TCW_WORKS_END_DATE}>');
          $('#works_uploader').hide();
        }else{
          $('#works_date_label').html('<{$smarty.const._MD_TCW_WORKS_DATE}>');
          $('#works_uploader').show();

        }

      });
    });
  </script>

  <{$formValidator_code}>


  <script type="text/javascript" src="<{$xoops_url}>/modules/tadtools/My97DatePicker/WdatePicker.js"></script>
  <h1><{$smarty.const._MD_TCW_WORKS_ADD}></h1>
  <div class="well">
    <form action="works.php" method="post" id="myForm" enctype="multipart/form-data" class="form-horizontal" role="form">
      <!--分類-->
      <{$cate_menu_form}>

      <!--作品名稱-->
      <div class="form-group">
        <div class="col-sm-12">
          <input type="text" name="WorkName" value="<{$WorkName}>" id="WorkName" class="validate[required] form-control" placeholder="<{$smarty.const._MD_TCW_WORKS_NAME}>">
        </div>
      </div>


      <!--作品說明-->
      <div class="form-group">
        <div class="col-sm-12">
          <textarea name="WorkDesc"  rows=4 id="WorkDesc"  class="form-control" placeholder="<{$smarty.const._MD_TCW_WORKS_DESC}>"><{$WorkDesc}></textarea>
        </div>
      </div>

      <!--上傳方式-->
      <div class="form-group">
        <label class="col-sm-2 control-label">
          <{$smarty.const._MD_TCW_WORKS_KIND}>
        </label>
        <div class="col-sm-4">
          <select name="WorksKind" class="form-control" id="WorksKind">
            <option value=""><{$smarty.const._MD_TCW_WORKS_KIND_DEFAULT}></option>
            <option value="mem_now" <{if $WorksKind=="mem_now"}>selected<{/if}>><{$smarty.const._MD_TCW_WORKS_KIND_MEM_NOW}></option>
            <option value="mem_after_end" <{if $WorksKind=="mem_after_end"}>selected<{/if}>><{$smarty.const._MD_TCW_WORKS_KIND_MEM_AFTER_END}></option>
          </select>
        </div>
        <!--是否啟用？-->
        <label class="col-sm-2 control-label">
          <{$smarty.const._MD_TCW_WORKS_ENABLE}>
        </label>
        <div class="col-sm-4">
          <label class="radio-inline">
            <input type="radio" name="WorksEnable" value="1" id="WorksEnable1" <{if $WorksEnable!="0"}>checked<{/if}>>
            <{$smarty.const._YES}>
          </label>
          <label class="radio-inline">
            <input type="radio" name="WorksEnable" value="0" id="WorksEnable0" <{if $WorksEnable=="0"}>checked<{/if}>>
            <{$smarty.const._NO}>
          </label>
        </div>
      </div>


      <!--作品日期-->
      <div class="form-group">
        <label class="col-sm-2 control-label" id="works_date_label">
          <{if $WorksKind!=""}>
            <{$smarty.const._MD_TCW_WORKS_END_DATE}>
          <{else}>
            <{$smarty.const._MD_TCW_WORKS_DATE}>
          <{/if}>
        </label>
        <div class="col-sm-4">
          <input type="text" name="WorksDate" class="form-control" value="<{$WorksDate}>" id="WorksDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})">
        </div>
      </div>

      <{$tags_form}>



      <!--上傳圖檔-->
      <div class="form-group" id="works_uploader" <{if $WorksKind!=""}>style="display:none;"<{/if}>>
        <label class="col-sm-2 control-label">
          <{$smarty.const._MD_TCW_WORKS_UPLOAD}>
        </label>
        <div class="col-sm-10">
          <{$upform}>
        </div>
      </div>

      <div class="form-group">
        <div class="col-sm-12 text-center">

          <!--作品編號-->
          <input type="hidden" name="WorksID" value="<{$WorksID}>">
          <!--所屬團隊-->
          <input type="hidden" name="WebID" value="<{$WebID}>">
          <input type="hidden" name="op" value="<{$next_op}>">
          <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
        </div>
      </div>
    </form>
  </div>
<{elseif $op=="show_one"}>

  <{if $isMyWeb}>
    <{$sweet_delete_works_func_code}>
  <{/if}>

  <h1>
  <{$WorkName}>
  </h1>

  <ol class="breadcrumb">
    <li><a href="works.php?WebID=<{$WebID}>"><{$smarty.const._MD_TCW_WORKS}></a></li>
    <{if isset($cate.CateID)}><li><a href="works.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a></li><{/if}>
    <li><{$WorksInfo}></li>
    <{if $tags}><li><{$tags}></li><{/if}>
    <{if $hide}><li><span class="label label-danger"><{$hide}></span></li><{/if}>
  </ol>

  <{if $WorkDesc}>
    <div class="well"><{$WorkDesc}></div>
  <{/if}>
  <div class="row">
    <{$pics}>
  </div>



  <{if $show_mem_upload_form}>

    <form action="works.php" method="post" id="myForm" enctype="multipart/form-data" class="form-horizontal" role="form">

      <!--上傳檔案-->
      <div class="form-group">
        <label class="col-sm-2 control-label">
          <{$smarty.const._MD_TCW_WORKS_UPLOAD}>
        </label>
        <div class="col-sm-10">
          <{$upform}>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-2 control-label">
          <{$smarty.const._MD_TCW_WORKS_DESCRIPTION}>
        </label>
        <div class="col-sm-10">
          <textarea name="WorkDesc" id="WorkDesc" cols="30" rows="3" class="form-control"></textarea>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-2 control-label">
          <{$smarty.const._MD_TCW_WORKS_UPLOADED_WORKS}>
        </label>
        <div class="col-sm-10">
          <{$mem_upload_content.list_del_file}>
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-2 control-label">
          <{$smarty.const._MD_TCW_WORKS_AUTHOR}>
        </label>
        <label class="col-sm-2 control-label">
          <{$LoginMemName}>
        </label>
      </div>


      <div class="form-group">
        <div class="col-sm-12 text-center">

          <!--作品編號-->
          <input type="hidden" name="LoginMemName" value="<{$LoginMemName}>">
          <input type="hidden" name="LoginMemID" value="<{$LoginMemID}>">
          <input type="hidden" name="WorksID" value="<{$WorksID}>">
          <input type="hidden" name="WebID" value="<{$WebID}>">
          <input type="hidden" name="op" value="mem_upload">
          <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
        </div>
      </div>
    </form>
  <{/if}>


  <{if $isMyWeb}>
    <div class="text-right" style="margin: 30px 0px;">
      <a href="javascript:delete_works_func(<{$WorksID}>);" class="btn btn-danger"><i class="fa fa-trash-o"></i> <{$smarty.const._TAD_DEL}><{$smarty.const._MD_TCW_WORKS_SHORT}></a>
      <a href="works.php?WebID=<{$WebID}>&op=edit_form" class="btn btn-info"><i class="fa fa-plus"></i> <{$smarty.const._MD_TCW_ADD}><{$smarty.const._MD_TCW_WORKS_SHORT}></a>
      <a href="works.php?WebID=<{$WebID}>&op=edit_form&WorksID=<{$WorksID}>" class="btn btn-warning"><i class="fa fa-pencil"></i> <{$smarty.const._TAD_EDIT}><{$smarty.const._MD_TCW_WORKS_SHORT}></a>
      <{if $WorksKind!==''}>
        <a href="works.php?WebID=<{$WebID}>&op=score_form&WorksID=<{$WorksID}>" class="btn btn-primary"><i class="fa fa-star-half-o"></i> <{$smarty.const._MD_TCW_WORKS_WORKS_SCORE_FORM}></a>
      <{/if}>
    </div>
  <{/if}>

  <{$fb_comments}>
<{elseif $op=="score_form" and $show_score_form}>

  <h2><a href="works.php?WebID=<{$WebID}>&WorksID=<{$WorksID}>"><{$WorkName}></a> <{$smarty.const._MD_TCW_WORKS_WORKS_SCORE_FORM}></h2>

  <ol class="breadcrumb">
    <li><a href="works.php?WebID=<{$WebID}>"><{$smarty.const._MD_TCW_WORKS}></a></li>
    <{if isset($cate.CateID)}><li><a href="works.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a></li><{/if}>
    <li><{$WorksInfo}></li>
  <{if $hide}><li><span class="label label-danger"><{$hide}></span></li><{/if}>
  </ol>

  <form action="works.php" method="post" id="myForm" enctype="multipart/form-data" class="form-horizontal" role="form">
    <{foreach from=$all_upload_content item=work}>
      <div class="row">
        <div class="col-sm-6">
          <div style="font-size: 2em;"><{$work.MemName}> @ <{$work.UploadDate}></div>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <label class="col-sm-3 control-label">
              <{$work.MemName}><{$smarty.const._MD_TCW_WORKS_WORKS_SCORE}>
            </label>
            <div class="col-sm-9">
              <input type="text" name="WorkScore[<{$work.MemID}>]" class="form-control" value="<{$work.WorkScore}>" placeholder="<{$smarty.const._MD_TCW_WORKS_WORKS_SCORE}>">
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-6">
          <{if $work.WorkDesc}><div class="alert alert-info"><{$work.WorkDesc}></div><{/if}>
          <{$work.list_del_file}>
        </div>
        <div class="col-sm-6">
          <div class="form-group">
            <div class="col-sm-12">
              <textarea type="text" name="WorkJudgment[<{$work.MemID}>]" class="form-control" placeholder="<{$smarty.const._MD_TCW_WORKS_WORKS_SCORE}>" style="height:150px;"><{$work.WorkJudgment}></textarea>
            </div>
          </div>
        </div>
      </div>
      <hr>
    <{/foreach}>

    <div class="form-group">
      <div class="col-sm-12 text-center">

        <!--作品編號-->
        <input type="hidden" name="WorksID" value="<{$WorksID}>">
        <!--所屬團隊-->
        <input type="hidden" name="WebID" value="<{$WebID}>">
        <input type="hidden" name="op" value="save_score">
        <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
      </div>
    </div>
  </form>
<{elseif $op=="list_all"}>
  <{if $WebID}>
    <div class="row">
      <div class="col-sm-8">
        <{$cate_menu}>
      </div>
      <div class="col-sm-4 text-right">
        <{if $isMyWeb and $WebID}>
          <a href="cate.php?WebID=<{$WebID}>&ColName=works&table=tad_web_works" class="btn btn-warning <{if $web_display_mode=='index'}>btn-xs<{/if}>"><i class="fa fa-folder-open"></i> <{$smarty.const._MD_TCW_CATE_TOOLS}></a>
          <a href="works.php?WebID=<{$WebID}>&op=edit_form" class="btn btn-info <{if $web_display_mode=='index'}>btn-xs<{/if}>"><i class="fa fa-plus"></i> <{$smarty.const._MD_TCW_ADD}><{$smarty.const._MD_TCW_WORKS_SHORT}></a>
        <{/if}>
      </div>
    </div>
  <{/if}>
  <{if $works_data}>
    <{$FooTableJS}>
    <{includeq file="$xoops_rootpath/modules/tad_web/plugins/works/tpls/tad_web_common_works.tpl"}>
  <{else}>
    <h1><a href="index.php?WebID=<{$WebID}>"><i class="fa fa-home"></i></a> <{$works.PluginTitle}></h1>
    <div class="alert alert-info"><{$smarty.const._MD_TCW_EMPTY}></div>
  <{/if}>
<{elseif $op=="setup"}>

  <{includeq file="$xoops_rootpath/modules/tad_web/templates/tad_web_plugin_setup.tpl"}>
<{else}>
    <h1><a href="index.php?WebID=<{$WebID}>"><i class="fa fa-home"></i></a> <{$works.PluginTitle}></h1>
    <{if $isMyWeb and $WebID}>
      <a href="works.php?WebID=<{$WebID}>&op=edit_form" class="btn btn-info"><i class="fa fa-plus"></i> <{$smarty.const._MD_TCW_ADD}><{$smarty.const._MD_TCW_WORKS_SHORT}></a>
    <{else}>
      <div class="text-center">
        <img src="images/empty.png" alt="<{$smarty.const._MD_TCW_EMPTY}>" title="<{$smarty.const._MD_TCW_EMPTY}>">
      </div>
    <{/if}>
<{/if}>