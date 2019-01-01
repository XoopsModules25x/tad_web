<{assign var="bc" value=$block.BlockContent}>
<{if $bc.main_data}>
  <{if $isMyWeb}>
    <{$sweet_delete_works_func_code}>
  <{/if}>

  <{includeq file="$xoops_rootpath/modules/tad_web/templates/tad_web_block_title.tpl"}>

  <table class="footable table common_table">
    <thead>
      <tr>
        <th data-hide="phone" style="width:100px;text-align:center;">
          <{$smarty.const._MD_TCW_WORKS_DATE}>
        </th>
        <th data-class="expand">
          <{$smarty.const._MD_TCW_WORKS_NAME}>
        </th>
        <th data-hide="phone" class="common_counter" style="text-align: center;">
          <{$smarty.const._MD_TCW_WORKS_COUNT}>
        </th>
      </tr>
    </thead>
    <{foreach item=work from=$bc.main_data}>
      <tr>
        <td style="text-align:center;">
          <{$work.WorksDate}>
        </td>
        <td>
          <{if isset($work.cate.CateID)}>
            <span class="label label-info"><a href="works.php?WebID=<{$work.WebID}>&CateID=<{$work.cate.CateID}>" style="color: #FFFFFF;"><{$work.cate.CateName}></a></span>
          <{/if}>
          <a href='works.php?WebID=<{$work.WebID}>&WorksID=<{$work.WorksID}>'><{$work.WorkName}></a>
          <{if $work.hide}><span class="label label-danger"><{$work.hide}></span><{/if}>
          <{if $work.isCanEdit}>
            <a href="javascript:delete_works_func(<{$work.WorksID}>);" class="text-danger"><i class="fa fa-trash-o"></i></a>
            <a href="works.php?WebID=<{$WebID}>&op=edit_form&WorksID=<{$work.WorksID}>" class="text-warning"><i class="fa fa-pencil"></i></a>
          <{/if}>
        </td>
        <td style="text-align:center;">
          <{$work.WorksCount}>
        </td>
      </tr>
    <{/foreach}>
  </table>
<{/if}>