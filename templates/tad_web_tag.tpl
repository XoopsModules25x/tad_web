
<{if $tag}>
    <h1><{$tag}> <small>(<a href="tag.php?WebID=<{$WebID}>"><{$smarty.const._MD_TCW_TAGS_LIST}></a>)</small></h1>


  <link rel="stylesheet" type="text/css" media="screen" href="<{$xoops_url}>/modules/tad_web/module.css" />

  <{foreach from=$show_arr item=dirname}>
    <{if "$xoops_rootpath/modules/tad_web/plugins/`$dirname`/tpls/tad_web_common_`$dirname`.tpl"|file_exists}>
      <div class="row">
        <div class="col-sm-12">
          <{includeq file="$xoops_rootpath/modules/tad_web/plugins/`$dirname`/tpls/tad_web_common_`$dirname`.tpl"}>
        </div>
      </div>
    <{/if}>
  <{/foreach}>
<{else}>
  <h1><{$smarty.const._MD_TCW_TAGS_LIST}></h1>
  <ul class="list-group">
    <{foreach from=$tags_arr key=tag item=count}>
      <li class="list-group-item">
        <span class="badge"><{$count}></span>
        <a href="<{$xoops_url}>/modules/tad_web/tag.php?WebID=<{$WebID}>&tag=<{$tag}>"><{$tag}></a>
      </li>
    <{/foreach}>
  </ul>
<{/if}>