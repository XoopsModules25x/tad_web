<{if $op=="edit_form"}>

  <{$formValidator_code}>


  <script type="text/javascript" src="<{$xoops_url}>/modules/tadtools/My97DatePicker/WdatePicker.js"></script>

  <h1><{$smarty.const._MD_TCW_MENU_ADD}></h1>
  <div class="well">
    <form action="menu.php" method="post" id="myForm" enctype="multipart/form-data" class="form-horizontal" role="form">

      <!--分類-->
      <{$cate_menu_form}>

      <!--選項名稱-->
      <div class="form-group">
        <div class="col-md-12">
          <input type="text" name="MenuName" value="<{$MenuName}>" id="MenuName" class="validate[required] form-control" placeholder="<{$smarty.const._MD_TCW_MENUNAME}>">
        </div>
      </div>


      <!--選項說明-->
      <div class="form-group">
        <div class="col-md-12">
          <textarea name="MenuDesc"  rows=4 id="MenuDesc"  class="form-control" placeholder="<{$smarty.const._MD_TCW_MENUDESC}>"><{$MenuDesc}></textarea>
        </div>
      </div>

      <!--選項日期-->
      <div class="form-group">
        <label class="col-md-2 control-label">
          <{$smarty.const._MD_TCW_MENUDATE}>
        </label>
        <div class="col-md-4">
          <input type="text" name="MenuDate" class="form-control" value="<{$MenuDate}>" id="MenuDate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd' , startDate:'%y-%M-%d'})">
        </div>
        <!--選項地點-->
        <label class="col-md-2 control-label">
          <{$smarty.const._MD_TCW_MENUPLACE}>
        </label>
        <div class="col-md-4">
          <input type="text" name="MenuPlace" class="form-control" value="<{$MenuPlace}>" id="MenuPlace" >
        </div>
      </div>

      <{$power_form}>
      <{$tags_form}>

      <!--上傳圖檔-->
      <div class="form-group">
        <label class="col-md-2 control-label">
          <{$smarty.const._MD_TCW_MENU_UPLOAD}>
        </label>
        <div class="col-md-10">
          <{$upform}>
        </div>
      </div>

      <div class="form-group">
        <div class="col-md-12 text-center">

          <!--選項編號-->
          <input type="hidden" name="MenuID" value="<{$MenuID}>">
          <!--所屬團隊-->
          <input type="hidden" name="WebID" value="<{$WebID}>">
          <input type="hidden" name="op" value="<{$next_op}>">
          <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
        </div>
      </div>
    </form>
  </div>
<{elseif $op=="show_one"}>
  <h1><{$MenuName}></h1>

  <ol class="breadcrumb">
    <li><a href="menu.php?WebID=<{$WebID}>"><{$smarty.const._MD_TCW_MENU}></a></li>
    <{if isset($cate.CateID)}><li><a href="menu.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a></li><{/if}>
    <li><{$MenuInfo}></li>
    <{if $tags}><li><{$tags}></li><{/if}>
  </ol>

  <div class="row" style="margin:10px 0px;">
    <{if $MenuDate}>
      <div class="col-md-6"><{$smarty.const._MD_TCW_MENUDATE}><{$smarty.const._TAD_FOR}><{$MenuDate}></div>
    <{/if}>

    <{if $MenuPlace}>
      <div class="col-md-6"><{$smarty.const._MD_TCW_MENUPLACE}><{$smarty.const._TAD_FOR}><{$MenuPlace}></div>
    <{/if}>
  </div>


  <div class="row">
    <{$pics}>
  </div>

  <{if $MenuDesc}>
    <hr>
    <div class="row">
      <div class="col-md-12">
        <div style="line-height: 1.8; font-size: 120%;"><{$MenuDesc}></div>
      </div>
    </div>
    <hr>
  <{/if}>

  <{$fb_comments}>

  <{if $isMyWeb}>
    <div class="text-right" style="margin: 30px 0px;">
      <a href="javascript:delete_menu_func(<{$MenuID}>);" class="btn btn-danger"><i class="fa fa-trash-o"></i> <{$smarty.const._TAD_DEL}><{$smarty.const._MD_TCW_MENU_SHORT}></a>
      <a href="menu.php?WebID=<{$WebID}>&op=edit_form" class="btn btn-info"><i class="fa fa-plus"></i> <{$smarty.const._MD_TCW_ADD}><{$smarty.const._MD_TCW_MENU_SHORT}></a>
      <a href="menu.php?WebID=<{$WebID}>&op=edit_form&MenuID=<{$MenuID}>" class="btn btn-warning"><i class="fa fa-pencil"></i> <{$smarty.const._TAD_EDIT}><{$smarty.const._MD_TCW_MENU_SHORT}></a>
    </div>
  <{/if}>
<{elseif $menu_data}>
  <{if $WebID}>
    <{$cate_menu}>
  <{/if}>
  <{$FooTableJS}>
  <div class="row">
    <div class="col-md-12">
      <{includeq file="$xoops_rootpath/modules/tad_web/plugins/menu/tpls/tad_web_common_menu.tpl"}>
    </div>
  </div>

<{elseif $op=="setup"}>

  <{includeq file="$xoops_rootpath/modules/tad_web/templates/tad_web_plugin_setup.tpl"}>
<{else}>
  <h1><a href="index.php?WebID=<{$WebID}>"><i class="fa fa-home"></i></a> <{$menu.PluginTitle}></h1>
  <{if $isMyWeb}>
    <a href="menu.php?WebID=<{$WebID}>&op=edit_form" class="btn btn-info"><i class="fa fa-plus"></i> <{$smarty.const._MD_TCW_ADD}><{$smarty.const._MD_TCW_MENU_SHORT}></a>
  <{else}>
    <div class="text-center">
      <img src="images/empty.png" alt="<{$smarty.const._MD_TCW_EMPTY}>" title="<{$smarty.const._MD_TCW_EMPTY}>">
    </div>
  <{/if}>
<{/if}>