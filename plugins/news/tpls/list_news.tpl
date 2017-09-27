<{assign var="bc" value=$block.BlockContent}>
<{if $bc.main_data}>
  <{if $block.config.show_mode=="list"}>
    <div class="row">
      <div class="col-sm-12">
        <{includeq file="$xoops_rootpath/modules/tad_web/templates/tad_web_block_title.tpl"}>
        <ul class="list-group">
          <{foreach from=$bc.main_data key=i item=news}>
            <li class="list-group-item">
            <span class="badge"><{$news.NewsCounter}></span>
            <{$news.Date}>
            <{if isset($news.cate.CateID)}>
              <span class="label label-info"><a href="news.php?WebID=<{$WebID}>&CateID=<{$news.cate.CateID}>" style="color: #FFFFFF;"><{$news.cate.CateName}></a></span>
            <{/if}>
            <a href="news.php?WebID=<{$news.WebID}>&NewsID=<{$news.NewsID}>"><{$news.NewsTitle}></a>
            <{if $news.NewsEnable!=1}>[<{$smarty.const._MD_TCW_NEWS_DRAFT}>]<{/if}>

              <{if $news.isMyWeb or $news.isAssistant}>
                <a href="javascript:delete_news_func(<{$news.NewsID}>);" class="text-danger"><i class="fa fa-trash-o"></i></a>
                <a href="news.php?WebID=<{$news.WebID}>&op=edit_form&NewsID=<{$news.NewsID}>" class="text-warning"><i class="fa fa-pencil"></i></a>
              <{/if}>
            </li>
          <{/foreach}>
        </ul>
      </div>
    </div>
  <{elseif $block.config.show_mode=="full"}>
  <script type="text/javascript">
    $(document).ready(function(){
      $('#list_new img').css('height','').addClass('img-responsive');
    });
  </script>
    <{foreach from=$bc.main_data key=i item=news}>
      <div class="row">
        <div class="col-sm-12">
          <{if $news.NewsContent}>
            <h3>
              <{$news.Date}>
              <a href="news.php?WebID=<{$WebID}>&NewsID=<{$news.NewsID}>"><{$news.NewsTitle}></a>
              <{if $news.NewsEnable!=1}>[<{$smarty.const._MD_TCW_NEWS_DRAFT}>]<{/if}>

              <{if $isMyWeb or $news.isAssistant}>
                <a href="javascript:delete_news_func(<{$news.NewsID}>);" class="text-danger"><i class="fa fa-trash-o"></i></a>
                <a href="news.php?WebID=<{$WebID}>&op=edit_form&NewsID=<{$news.NewsID}>"class="text-warning"><i class="fa fa-pencil"></i></a>
              <{/if}>
            </h3>
            <div class="well" id="list_new" style="min-height: 100px; overflow: auto; line-height: 1.8; ">
              <{if isset($news.cate.CateID)}>
                <span class="label label-info"><a href="news.php?WebID=<{$WebID}>&CateID=<{$news.cate.CateID}>" style="color: #FFFFFF;"><{$news.cate.CateName}></a></span>
              <{/if}>
              <{$news.NewsContent}>
              <{if $news.more}>
                <a href="news.php?WebID=<{$WebID}>&NewsID=<{$news.NewsID}>"><{$smarty.const._MD_TCW_READ_MORE}></a>
              <{/if}>
            </div>
          <{else}>
            <div class="well" style="height: 100px; overflow: auto; line-height: 1.8; ">
              <h3>
                <{$news.Date}>
                <a href="news.php?WebID=<{$WebID}>&NewsID=<{$news.NewsID}>"><{$news.NewsTitle}></a>
                <{if $news.NewsEnable!=1}>[<{$smarty.const._MD_TCW_NEWS_DRAFT}>]<{/if}>

                <{if $isMyWeb or $news.isAssistant}>
                  <a href="javascript:delete_news_func(<{$news.NewsID}>);" class="text-danger"><i class="fa fa-trash-o"></i></a>
                  <a href="news.php?WebID=<{$WebID}>&op=edit_form&NewsID=<{$news.NewsID}>" class="text-warning"><i class="fa fa-pencil"></i></a>
                <{/if}>
              </h3>
            </div>
          <{/if}>
        </div>
      </div>
    <{/foreach}>
  <{else}>
    <script type="text/javascript">
      $(document).ready(function(){
        $('#list_new img').css('height','').addClass('img-responsive');
      });
    </script>
    <div class="row">
      <div class="col-sm-12">
        <{if $bc.main_data.0.NewsContent}>
          <h3>
            <{$bc.main_data.0.Date}>
            <a href="news.php?WebID=<{$WebID}>&NewsID=<{$bc.main_data.0.NewsID}>"><{$bc.main_data.0.NewsTitle}></a>
            <{if $bc.main_data.0.NewsEnable!=1}>[<{$smarty.const._MD_TCW_NEWS_DRAFT}>]<{/if}>

            <{if $isMyWeb or $bc.main_data.0.isAssistant}>
              <a href="javascript:delete_news_func(<{$bc.main_data.0.NewsID}>);" class="text-danger"><i class="fa fa-trash-o"></i></a>
              <a href="news.php?WebID=<{$WebID}>&op=edit_form&NewsID=<{$bc.main_data.0.NewsID}>"class="text-warning"><i class="fa fa-pencil"></i></a>
            <{/if}>
          </h3>
          <div class="well" id="list_new" style="min-height: 100px; overflow: auto; line-height: 1.8; ">
            <{if isset($bc.main_data.0.cate.CateID)}>
              <span class="label label-info"><a href="news.php?WebID=<{$WebID}>&CateID=<{$bc.main_data.0.cate.CateID}>" style="color: #FFFFFF;"><{$bc.main_data.0.cate.CateName}></a></span>
            <{/if}>
            <{$bc.main_data.0.NewsContent}>
            <{if $bc.main_data.0.more}>
              <a href="news.php?WebID=<{$WebID}>&NewsID=<{$bc.main_data.0.NewsID}>"><{$smarty.const._MD_TCW_READ_MORE}></a>
            <{/if}>
          </div>
        <{else}>
          <div class="well" style="height: 100px; overflow: auto; line-height: 1.8; ">
            <h3>
              <{$bc.main_data.0.Date}>
              <a href="news.php?WebID=<{$WebID}>&NewsID=<{$bc.main_data.0.NewsID}>"><{$bc.main_data.0.NewsTitle}></a>
              <{if $bc.main_data.0.NewsEnable!=1}>[<{$smarty.const._MD_TCW_NEWS_DRAFT}>]<{/if}>

              <{if $isMyWeb or $bc.main_data.0.isAssistant}>
                <a href="javascript:delete_news_func(<{$bc.main_data.0.NewsID}>);" class="text-danger"><i class="fa fa-trash-o"></i></a>
                <a href="news.php?WebID=<{$WebID}>&op=edit_form&NewsID=<{$bc.main_data.0.NewsID}>" class="text-warning"><i class="fa fa-pencil"></i></a>
              <{/if}>
            </h3>
          </div>
        <{/if}>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-12">
        <ul class="list-group">
          <{foreach from=$bc.main_data key=i item=news}>
            <{if $i > 0}>
              <li class="list-group-item">
              <span class="badge"><{$news.NewsCounter}></span>
              <{$news.Date}>
              <{if isset($news.cate.CateID)}>
                <span class="label label-info"><a href="news.php?WebID=<{$WebID}>&CateID=<{$news.cate.CateID}>" style="color: #FFFFFF;"><{$news.cate.CateName}></a></span>
              <{/if}>
              <a href="news.php?WebID=<{$news.WebID}>&NewsID=<{$news.NewsID}>"><{$news.NewsTitle}></a>
            <{if $news.NewsEnable!=1}>[<{$smarty.const._MD_TCW_NEWS_DRAFT}>]<{/if}>

                <{if $news.isMyWeb or $news.isAssistant}>
                  <a href="javascript:delete_news_func(<{$news.NewsID}>);" class="text-danger"><i class="fa fa-trash-o"></i></a>
                  <a href="news.php?WebID=<{$news.WebID}>&op=edit_form&NewsID=<{$news.NewsID}>" class="text-warning"><i class="fa fa-pencil"></i></a>
                <{/if}>
              </li>
            <{/if}>
          <{/foreach}>
        </ul>
      </div>
    </div>
  <{/if}>
<{/if}>