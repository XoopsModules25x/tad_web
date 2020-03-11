<{if $op=="show_one"}>

  <div class="row">
    <div class="col-sm-4">
      <{if $class_pic_thumb}>
        <div class="well" style="background-image:url('<{$class_pic_thumb}>');background-repeat:no-repeat;background-size:cover;background-position:center; height:<{if $isMyWeb}>220px<{else}>150px<{/if}>;"></div>
      <{else}>
        <div class="well" style="height: 150px; line-height:  100px; text-align: center;"><{$no_class_photo}></div>
      <{/if}>
    </div>
    <div class="col-sm-8">

      <div class="row">
        <div class="col-sm-12">
          <{$cate_menu}>
        </div>
      </div>

      <div class="well">
        <div>
          <{$teacher_name}><{$smarty.const._TAD_FOR}><{$WebOwner}>
        </div>
        <div>
          <{$student_amount}><{$smarty.const._TAD_FOR}> <{$smarty.const._MD_TCW_TOTAL}>
          <{$class_total}> <{$smarty.const._MD_TCW_PEOPLE}>
          <a href="#" class="btn btn-info btn-xs">
            <i class="fa fa-male"></i> <{$class_boy}>
          </a>
          <a href="#" class="btn btn-danger btn-xs">
            <i class="fa fa-female"></i> <{$class_girl}>
          </a>
        </div>
      </div>

      <{if $all_mems}>
        <style>
          .draggable {padding: 5px; margin: 0 10px 10px 0; font-size: 75%; border:0px dotted gray;position:absolute;}
          #snaptarget {width:640px;height: 540px; border:1px solid black;background:#CC6633 url('images/classroom2.png') center center no-repeat;position:relative;}
        </style>

        <script>
          function IsNumeric(n){
            return !isNaN(n);
          }

          $(function(){

              $('#getit').click(function() {

                  var numLow = <{$min}>;
                  var numHigh = <{$max}>;

                  var adjustedHigh = (parseFloat(numHigh) - parseFloat(numLow)) + 1;

                  var numRand = Math.floor(Math.random()*adjustedHigh) + parseFloat(numLow);

                  if ((IsNumeric(numLow)) && (IsNumeric(numHigh)) && (parseFloat(numLow) <= parseFloat(numHigh)) && (numLow != '') && (numHigh != '')) {
                      $('#randomnumber').html('<div class="well"><{$smarty.const._MD_TCW_GOT_YOU}>' + numRand +'<{$smarty.const._MD_TCW_NUMBER}></div>');
                      $('#'+numRand).clone().appendTo('#MemRandList').css('top','0px').css('left','0px').css('position','relative').css('float','left');
                  } else {
                      $('#randomnumber').html('<{$smarty.const._MD_TCW_AGAIN}>');
                  }

                  return false;
              });


              $('#clear').click(function() {
                $('#MemRandList').html('');
                $('#randomnumber').html('');
              });

          });
        </script>


        <div class="row">
          <div class="col-sm-12">
            <{if $isMyWeb}>
              <{if 'position'|in_array:$mem_function and !'all_dont'|in_array:$mem_function}>
                <a class="btn btn-success" href="aboutus.php?WebID=<{$WebID}>&CateID=<{$CateID}>&op=edit_position"><{$smarty.const._MD_TCW_STUDENT_POSITION}></a>
              <{/if}>
              <a class="btn btn-info" href="aboutus.php?WebID=<{$WebID}>&CateID=<{$CateID}>&op=edit_class_stu"><{$edit_student}></a>
              <{if 'export'|in_array:$mem_function and !'all_dont'|in_array:$mem_function}>
                <a class="btn btn-warning" href="aboutus.php?WebID=<{$WebID}>&CateID=<{$CateID}>&op=export_config"><{$smarty.const._MD_TCW_ABOUTUS_EXPORT}></a>
              <{/if}>
            <{/if}>
            <{if 'lotto'|in_array:$mem_function and !'all_dont'|in_array:$mem_function}>
              <button id="getit" class="btn btn-primary"><{$smarty.const._MD_TCW_GET_SOMEONE}></button>
              <button id="clear" class="btn btn-danger"><{$smarty.const._MD_TCW_CLEAR}></button>
            <{/if}>

            <{if 'slot'|in_array:$mem_function and !'all_dont'|in_array:$mem_function}>
              <a class="btn btn-warning" href="aboutus.php?WebID=<{$WebID}>&CateID=<{$CateID}>&op=mem_slot"><{$smarty.const._MD_TCW_ABOUTUS_SLOT}></a>
            <{/if}>
          </div>
        </div>
      <{/if}>
    </div>
  </div>

  <{if $all_mems}>
    <div class="row">
      <div class="col-sm-12">
        <div id="randomnumber" style="font-size:100%;"></div>
        <div id="MemRandList"></div>
      </div>
    </div>

    <{if $mem_list_mode=="table"}>
      <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
          <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_NAME}></th>
          <th style="text-align: center;" style="text-align: center;"><{$smarty.const._MD_TCW_MEM_SEX}></th>
          <{if 'MemNickName'|in_array:$mem_column}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_NICKNAME}></th>
          <{/if}>
          <{if 'MemExpertises'|in_array:$mem_column}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_EXPERTISES}></th>
          <{/if}>
          <{if 'MemClassOrgan'|in_array:$mem_column}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_CLASSORGAN}></th>
          <{/if}>
          <{if 'AboutMem'|in_array:$mem_column}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_ABOUTME}></th>
          <{/if}>
          <{if $isMyWeb}>
            <{if 'MemUnicode'|in_array:$mem_column}>
              <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_UNICODE}></th>
            <{/if}>
            <{if 'MemBirthday'|in_array:$mem_column}>
              <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_BIRTHDAY}></th>
            <{/if}>
            <th style="text-align: center;"><{$smarty.const._TAD_FUNCTION}></th>
          <{/if}>
        </tr>
        <{foreach from=$all_mems item=stud}>
          <tr>
            <td>
              <div class="well" style="width: 60px; height: 60px; background: transparent url('<{$stud.pic}>') top center no-repeat; <{$stud.style}>; <{$stud.cover}> padding: 0px; float: left; margin-right:4px;"></div>

              <{if 'MemNum'|in_array:$mem_column}>
                <div><{$smarty.const._MD_TCW_MEM_NUM}>: <{$stud.MemNum}></div>
              <{/if}>
              <div>
              <{if $isMyWeb}>
                <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$stud.MemID}>&op=show_stu"><{$stud.MemName}></a>
              <{else}>
                <{$stud.MemName}>
              <{/if}>
              </div>
              <div style="clear: both;"></div>
            </td>
            <td style="text-align: center;"><{$stud.MemSexTitle}></td>
            <{if 'MemNickName'|in_array:$mem_column}>
              <td style="text-align: center;"><{$stud.MemNickName}></td>
            <{/if}>
            <{if 'MemExpertises'|in_array:$mem_column}>
              <td style="text-align: center;"><{$stud.MemExpertises}></td>
            <{/if}>
            <{if 'MemClassOrgan'|in_array:$mem_column}>
              <td style="text-align: center;"><{$stud.MemClassOrgan}></td>
            <{/if}>
            <{if 'AboutMem'|in_array:$mem_column}>
              <td><{$stud.AboutMem}></td>
            <{/if}>
            <{if $isMyWeb}>
              <{if 'MemUnicode'|in_array:$mem_column}>
                <td style="text-align: center;"><{$stud.MemUnicode}></td>
              <{/if}>
              <{if 'MemBirthday'|in_array:$mem_column}>
                <td style="text-align: center;"><{$stud.MemBirthday}></td>
              <{/if}>
              <td style="text-align: center;"><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$CateID}>&MemID=<{$stud.MemID}>&op=edit_stu" class="btn btn-xs btn-warning"><{$smarty.const._TAD_EDIT}></a></td>
            <{/if}>
          </tr>
        <{/foreach}>
      </table>
    <{elseif $mem_list_mode=="mem_detail"}>

      <{foreach from=$all_mems item=stud}>
        <div class="well">
        <div class="row">
          <div class="col-sm-2">
            <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$stud.MemID}>&op=show_stu"">
              <img src="<{$stud.pic}>" alt="<{$stud.MemName}>" class="img-responsive img-rounded">
            </a>
          </div>
          <div class="col-sm-3">

            <{if 'MemNum'|in_array:$mem_column}>
              <div style="margin: 2px;">
                <span class="label label-default"><{$smarty.const._MD_TCW_MEM_NUM}></span>
                <{$stud.MemNum}>
              </div>
            <{/if}>

            <div style="margin: 2px;">
              <span class="label label-default"><{$smarty.const._MD_TCW_MEM_NAME}></span>
              <{if $isMyWeb}>
                <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$stud.MemID}>&op=show_stu"><{$stud.MemName}></a>
                <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$CateID}>&MemID=<{$stud.MemID}>&op=edit_stu" class="btn btn-xs btn-warning"><{$smarty.const._TAD_EDIT}></a>
              <{else}>
                <{$stud.MemName}>
              <{/if}>
            </div>

            <div style="margin: 2px;">
              <span class="label label-default"><{$smarty.const._MD_TCW_MEM_SEX}></span>
              <{$stud.MemSexTitle}>
            </div>

            <{if 'MemNickName'|in_array:$mem_column and $stud.MemNickName}>
              <div style="margin: 2px;">
                <span class="label label-default"><{$smarty.const._MD_TCW_MEM_NICKNAME}></span>
                <{$stud.MemNickName}>
              </div>
            <{/if}>

            <{if $isMyWeb}>
              <{if 'MemUnicode'|in_array:$mem_column and $stud.MemUnicode}>
                <div style="margin: 2px;">
                  <span class="label label-danger"><{$smarty.const._MD_TCW_MEM_UNICODE}></span>
                  <{$stud.MemUnicode}>
                </div>
              <{/if}>

              <{if 'MemBirthday'|in_array:$mem_column and $stud.MemBirthday}>
                <div style="margin: 2px;">
                  <span class="label label-danger"><{$smarty.const._MD_TCW_MEM_BIRTHDAY}></span>
                  <{$stud.MemBirthday}>
                </div>
              <{/if}>

              <{if 'MemExpertises'|in_array:$mem_column and $stud.MemExpertises}>
                <div style="margin: 2px;">
                  <span class="label label-default"><{$smarty.const._MD_TCW_MEM_EXPERTISES}></span>
                  <{$stud.MemExpertises}>
                </div>
              <{/if}>
            <{/if}>
          </div>
          <div class="col-sm-7">

            <{if 'MemClassOrgan'|in_array:$mem_column and $stud.MemClassOrgan and $stud.MemClassOrgan}>
              <div style="margin: 2px;">
                <span class="label label-default"><{$smarty.const._MD_TCW_MEM_CLASSORGAN}></span>
                <{$stud.MemClassOrgan}>
              </div>
            <{/if}>


            <{if 'AboutMem'|in_array:$mem_column and $stud.AboutMem and $stud.AboutMem}>
              <div style="margin: 2px;">
                <!--span class="label label-default"><{$smarty.const._MD_TCW_MEM_ABOUTME}></span-->
                <div class="alert alert-info" style="margin-top:4px;"><{$stud.AboutMem}></div>
              </div>
            <{/if}>


          </div>
        </div>


        </div>
      <{/foreach}>
    <{else}>
      <div class="demo">
        <div id="snaptarget">
          <{$students1}>
        </div>

        <br style="clear:both;">
        <{$students2}>

        <br style="clear:both;">
      </div>
    <{/if}>
  <{else}>

    <div class="jumbotron">
      <h2><{$no_student}></h2>

      <{if $isMyWeb}>
      <p>
        <a class="btn btn-success" href="aboutus.php?WebID=<{$WebID}>&op=import_excel_form&CateID=<{$CateID}>"><{$import_excel}></a>
        <a class="btn btn-info" href="aboutus.php?WebID=<{$WebID}>&op=edit_stu&CateID=<{$CateID}>"><{$add_stud}></a>
      </p>
      <{/if}>
    </div>
  <{/if}>


  <{if $isMyWeb}>
    <div class="text-right">
      <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=new_class" class="btn btn-primary"><{$add_class}></a>
      <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=edit_form" class="btn btn-warning"><{$class_setup}></a>
    </div>
  <{/if}>
<{elseif ($op=="edit_form" or $op=="new_class") and $isMyWeb}>

  <{if $op=="new_class" or $now_cate}>
    <form action="aboutus.php?WebID=<{$WebID}>" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
      <h3><{$class_setup}></h3>
      <div class="row">
        <div class="col-sm-4">
          <{if $class_pic_thumb}>
            <div class="well" style="background-image:url('<{$class_pic_thumb}>');background-repeat:no-repeat;background-size: contain;background-position:center; height:<{if $isMyWeb}>220px<{else}>150px<{/if}>;"></div>
          <{else}>
            <div class="well" style="height: 150px; line-height:  100px; text-align: center;"><{$no_class_photo}></div>
          <{/if}>
        </div>
        <div class="col-sm-8">

          <div class="form-group">
            <label class="col-sm-3 control-label">
              <{$edit_class_title}>
            </label>
            <div class="col-sm-9">

                <div class="input-group">
                  <div class="input-group-btn ">
                    <select name="year" class="form-control" style="width:140px;">
                      <option value="" <{if $op!="new_class"}>selected<{/if}>></option>
                      <option value="<{$last_year}>"><{$last_year}></option>
                      <option value="<{$now_year}>" <{if $op=="new_class"}>selected<{/if}>><{$now_year}></option>
                      <option value="<{$next_year}>"><{$next_year}></option>
                    </select>
                  </div>
                  <input type="text" name="newCateName" value="<{$now_cate.CateName}>" class="form-control">
                </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">
              <{$class_pic}>
            </label>
            <div class="col-sm-9">
              <{$upform_class}>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">
              <{$smarty.const._MD_TCW_ABOUTUS_DEFAULT_CLASS}>
            </label>
            <div class="col-sm-9">
              <label class="checkbox-inline">
                <input type="checkbox" name="default_class" value='1' <{if $default_class==$CateID}>checked<{/if}>>
                <{$smarty.const._MD_TCW_ABOUTUS_DEFAULT_CLASS_DESC}>
              </label>
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-3 control-label">
              <{$smarty.const._MD_TCW_ABOUTUS_HIDE_CLASS}>
            </label>
            <div class="col-sm-9">
              <label class="checkbox-inline">
                <input type="checkbox" name="hide_class" value='1' <{if $hide_class==$CateID}>checked<{/if}>>
                <{$smarty.const._MD_TCW_ABOUTUS_HIDE_CLASS_DESC}>
              </label>
            </div>
          </div>

          <{if $op=="new_class" and $old_cate}>
            <div class="form-group">
              <label class="col-sm-3 control-label">
                <{$setup_stud}>
              </label>
              <div class="col-sm-9">
                <select name="form_CateID" class="form-control">
                  <option value=""><{$smarty.const._MD_TCW_STUDENT_NO_COPY}></option>
                  <{foreach from=$old_cate item=cate}>
                    <option value="<{$cate.CateID}>"><{$cate.CateNameMem}></option>
                  <{/foreach}>
                </select>
              </div>
            </div>
          <{/if}>
          <div class="text-center">
            <input type="hidden" name="op" value="<{$next_op}>">
            <input type="hidden" name="WebID" value="<{$WebID}>">
            <input type="hidden" name="CateID" value="<{$CateID}>">
            <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
          </div>
          <div class="alert alert-warning"><{$smarty.const._MD_TCW_STUDENT_NOTE}></div>
        </div>
      </div>

    </form>
  <{/if}>

  <{if $old_cate}>
    <script type="text/javascript">
      $(document).ready(function(){
          $('#sort').sortable({ opacity: 0.6, cursor: 'move', update: function() {
              var order = $(this).sortable('serialize');
              $.post('<{$xoops_url}>/modules/tad_web/plugins/aboutus/save_sort.php', order, function(theResponse){
                  $('#save_msg').html(theResponse);
              });
          }
          });
      });
    </script>
    <h3><{$class_list}></h3>
    <div id="save_msg"></div>
    <table class="table table-bordered">
      <tr>
        <th style="text-align: center;"><{$class_title}></th>
        <th style="text-align: center;"><{$student_amount}></th>
        <th style="text-align: center;"><{$smarty.const._TAD_FUNCTION}></th>
      </tr>
      <tbody id="sort">
        <{foreach from=$old_cate item=cate}>
          <tr id="CateID_<{$cate.CateID}>" <{if $cate.CateEnable!=1}>style="background: #cfcfcf;"<{/if}>>
            <td>
              <img src="<{$xoops_url}>/modules/tadtools/treeTable/images/updown_s.png" style="cursor: s-resize;margin:0px 4px;" alt="<{$smarty.const._TAD_SORTABLE}>" title="<{$smarty.const._TAD_SORTABLE}>">
              <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a>
              <{if $cate.CateEnable!=1}>
                <a href="javascript:del_class(<{$cate.CateID}>)" class="btn btn-xs btn-danger"><{$smarty.const._TAD_DEL}></a>
              <{/if}>
            </td>
            <td style="text-align: center;">
              <{$cate.CateMemCount}>
            </td>
            <td style="text-align: center;">
              <{if $cate.CateEnable!=1}>
                <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=class_enable" class="btn btn-xs btn-success"><{$smarty.const._MD_TCW_ENABLE}></a>
              <{else}>
                <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=class_unable" class="btn btn-xs btn-default"><{$smarty.const._MD_TCW_UNABLE}></a>
              <{/if}>
              <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=edit_form" class="btn btn-xs btn-warning"><{$smarty.const._TAD_EDIT}></a>
              <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=edit_position" class="btn btn-xs btn-success"><{$smarty.const._MD_TCW_STUDENT_POSITION}></a>

              <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=edit_class_stu" class="btn btn-xs btn-info"><{$edit_student}></a>
            </td>
          </tr>
        <{/foreach}>
      </tbody>
    </table>
  <{/if}>

  <div class="text-right">
    <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=new_class" class="btn btn-primary"><{$add_class}></a>
  </div>
<{elseif $op=="edit_class_stu"}>
  <h3><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a> <{$edit_student}></h3>
  <{if $students}>
    <div class="text-right" style="margin: 30px 0px;">
      <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&op=edit_stu" class="btn btn-primary"><{$add_stud}></a>
    </div>
    <table class="table table-striped table-bordered table-hover table-condensed">
      <tr>
        <th><{$smarty.const._MD_TCW_MEM_NUM}></th>
        <th><{$smarty.const._MD_TCW_MEM_NAME}></th>
        <th><{$smarty.const._MD_TCW_MEM_UNICODE}></th>
        <th><{$smarty.const._MD_TCW_MEM_BIRTHDAY}></th>
        <th><{$smarty.const._MD_TCW_MEM_SEX}></th>
        <th><{$smarty.const._MD_TCW_MEM_NICKNAME}></th>
        <th><{$smarty.const._MD_TCW_MEM_UNAME}></th>
        <th><{$smarty.const._MD_TCW_MEM_PASSWD}></th>
        <th><{$smarty.const._TAD_FUNCTION}></th>
      </tr>
      <{foreach from=$students item=stud}>
      <tr>
        <td style="text-align: center;"><{$stud.MemNum}></td>
        <td style="text-align: center;"><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$stud.MemID}>&op=show_stu"><{$stud.MemName}></a></td>
        <td style="text-align: center;"><{$stud.MemUnicode}></td>
        <td style="text-align: center;"><{$stud.MemBirthday}></td>
        <td style="text-align: center;"><{$stud.MemSex}></td>
        <td><{$stud.MemNickName}></td>
        <td><{$stud.MemUname}></td>
        <td><{$stud.MemPasswd}></td>
        <td style="text-align: center;"><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$CateID}>&MemID=<{$stud.MemID}>&op=edit_stu" class="btn btn-xs btn-warning"><{$smarty.const._TAD_EDIT}></a></td>
      </tr>
      <{/foreach}>
    </table>
  <{else}>

    <div class="jumbotron">
      <h2><{$no_student}></h2>

      <{if $isMyWeb}>
      <p>
        <a class="btn btn-success" href="aboutus.php?WebID=<{$WebID}>&op=import_excel_form&CateID=<{$CateID}>"><{$import_excel}></a>
        <a class="btn btn-info" href="aboutus.php?WebID=<{$WebID}>&op=edit_stu&CateID=<{$CateID}>"><{$add_stud}></a>
      </p>
      <{/if}>
    </div>

  <{/if}>
<{elseif $op=="edit_position"}>

    <{includeq file="$xoops_rootpath/modules/tad_web/plugins/aboutus/tpls/b3/tad_web_mem_position.tpl"}>
<{elseif $op=="edit_stu"}>

    <{includeq file="$xoops_rootpath/modules/tad_web/plugins/aboutus/tpls/b3/tad_web_mem_form.tpl"}>
<{elseif $op=="show_stu"}>

  <h2><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a></h2>
  <div style="font-size: 2em; margin: 30px auto;">
    <{if 'MemNum'|in_array:$mem_column}>
      <label class="label label-primary"><{$class_mem.MemNum}></label>
    <{/if}>
    <{$mem.MemName}>
    <{if 'MemUnicode'|in_array:$mem_column}>
      (<{$mem.MemUnicode}>)
    <{/if}>
  </div>

  <div class="row">

    <div class="col-sm-8">
      <div class="row">
        <div class="col-sm-8">

          <!--性別-->
          <div class="row">
            <label class="col-xs-3"><{$smarty.const._MD_TCW_MEM_SEX}></label>
            <div class="col-xs-9">
              <{$mem.MemSex}>
            </div>
          </div>

          <!--是否還在班上-->
          <div class="row">
            <label class="col-xs-3"><{$smarty.const._MD_TCW_MEM_STATUS}></label>
            <div class="col-xs-9">
              <{$class_mem.MemEnable}>
            </div>
          </div>


          <!--生日-->
          <{if 'MemBirthday'|in_array:$mem_column}>
            <div class="row">
              <label class="col-xs-3"><{$smarty.const._MD_TCW_MEM_BIRTHDAY}></label>
              <div class="col-xs-9">
                <{$mem.MemBirthday}>
              </div>
            </div>
          <{/if}>

          <!--學生暱稱-->
          <{if 'MemNickName'|in_array:$mem_column}>
            <div class="row">
              <label class="col-xs-3"><{$smarty.const._MD_TCW_MEM_NICKNAME}></label>
              <div class="col-xs-9">
                <{$mem.MemNickName}>
              </div>
            </div>
          <{/if}>

          <!--專長-->
          <{if 'MemExpertises'|in_array:$mem_column}>
            <div class="row">
              <label class="col-xs-3"><{$smarty.const._MD_TCW_MEM_EXPERTISES}></label>
              <div class="col-xs-9">
                <{$mem.MemExpertises}>
              </div>
            </div>
          <{/if}>

          <!--職稱-->
          <{if 'MemClassOrgan'|in_array:$mem_column}>
            <div class="row">
              <label class="col-xs-3"><{$smarty.const._MD_TCW_MEM_CLASSORGAN}></label>
              <div class="col-xs-9">
                <{$class_mem.MemClassOrgan}>
              </div>
            </div>
          <{/if}>
        </div>

        <div class="col-sm-4 text-center">
          <img src="<{$pic}>" alt="<{$mem.MemName}>" class="img-responsive img-rounded">
        </div>
      </div>

      <!--自我介紹-->
      <{if 'AboutMem'|in_array:$mem_column}>
        <div class="row">
          <label class="col-sm-2"><{$smarty.const._MD_TCW_MEM_ABOUTME}></label>
          <div class="col-sm-10">
            <{$class_mem.AboutMem}>
          </div>
        </div>
      <{/if}>



    <{if $isMyWeb}>
      <div class="text-center" style="margin: 30px auto;">
        <a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$mem.MemID}>&op=edit_stu" class="btn btn-warning"><{$smarty.const._TAD_EDIT}></a>
      </div>
    <{/if}>

    </div>
    <div class="col-sm-4">
      <{if $im_student}>
       <{includeq file="$xoops_rootpath/modules/tad_web/plugins/aboutus/tpls/b3/mem_toolbar.tpl"}>
      <{elseif $students}>
        <table class="table table-striped table-bordered table-hover table-condensed">
          <tr>
          <{if 'MemNum'|in_array:$mem_column}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_NUM}></th>
          <{/if}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_NAME}></th>
          <{if 'MemUnicode'|in_array:$mem_column}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_UNICODE}></th>
          <{/if}>
            <th style="text-align: center;"><{$smarty.const._MD_TCW_MEM_SEX}></th>
          </tr>
          <{foreach from=$students item=stud}>
          <tr>
          <{if 'MemNum'|in_array:$mem_column}>
            <td style="text-align: center;<{if $stud.MemID==$mem.MemID}>background: yellow;<{/if}>"><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$stud.MemID}>&op=show_stu"><{$stud.MemNum}></a></td>
          <{/if}>
            <td style="text-align: center;<{if $stud.MemID==$mem.MemID}>background: yellow;<{/if}>"><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$stud.MemID}>&op=show_stu"><{$stud.MemName}></a></td>
          <{if 'MemUnicode'|in_array:$mem_column}>
            <td style="text-align: center;<{if $stud.MemID==$mem.MemID}>background: yellow;<{/if}>"><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>&MemID=<{$stud.MemID}>&op=show_stu"><{$stud.MemUnicode}></a></td>
          <{/if}>
            <td style="text-align: center; color: <{$stud.color}>;<{if $stud.MemID==$mem.MemID}>background: yellow;<{/if}>"><{$stud.MemSex}></td>
          </tr>
          <{/foreach}>
        </table>
      <{/if}>
    </div>
  </div>

  <{if $stud_works.main_data}>
    <h2><{$smarty.const._MD_TCW_ABOUTUS_UPLOAD_WORKS}></h2>
    <{foreach from=$stud_works.main_data item=work}>
      <div class="well">
        <div class="row">
          <div class="col-sm-8">
            <span style="font-size: 2em;">
              <a href="works.php?WebID=<{$WebID}>&WorksID=<{$work.WorksID}>" target="_blank"><{$work.WorkName}></a>
            </span>
          </div>
          <div class="col-sm-4">
            <{if $work.mem_upload_content.UploadDate!=""}>
              <a href="works.php?WebID=<{$WebID}>&WorksID=<{$work.WorksID}>" target="_blank"class="btn btn-primary btn-block"><{$work.mem_upload_content.mem_upload_date}></a>
            <{else}>
              <a href="works.php?WebID=<{$WebID}>&WorksID=<{$work.WorksID}>" target="_blank" class="btn btn-success btn-block"><{$smarty.const._MD_TCW_ABOUTUS_UPLOAD_NOW}></a>
            <{/if}>
          </div>
        </div>

        <ol class="breadcrumb">
          <li><{$smarty.const._MD_TCW_WORKS_END_DATE}>: <{$work.WorksDate}></li>
        </ol>

        <{if $work.WorkDesc}>
          <{$work.WorkDesc}>
        <{/if}>
      </div>
    <{/foreach}>
  <{/if}>

  <{if $stud_scores.main_data}>
    <h2><{$smarty.const._MD_TCW_ABOUTUS_UPLOADED_WORKS}></h2>
    <table class="table">
      <tr>
        <th><{$smarty.const._MD_TCW_WORKS_NAME}></th>
        <th><{$smarty.const._MD_TCW_WORKS_WORKS_SCORE}></th>
        <th><{$smarty.const._MD_TCW_WORKS_WORKS_JUDGMENT}></th>
      </tr>
    <{foreach from=$stud_scores.main_data item=work}>
      <tr>
        <td><a href="works.php?WebID=<{$WebID}>&WorksID=<{$work.WorksID}>" target="_blank"><{$work.WorkName}></a></td>
        <td><{$work.mem_upload_content.WorkScore}></td>
        <td><{$work.mem_upload_content.WorkJudgment}></td>
      </tr>
    <{/foreach}>
    </table>
  <{/if}>
<{elseif $op=="import_excel_form"}>
  <h3><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a> <{$edit_student}></h3>
  <div class="well">
    <form action="aboutus.php?WebID=<{$WebID}>" method="post" enctype="multipart/form-data">
        <div class="row">
          <label class="col-sm-3"><{$import_excel}></label>
          <div class="col-sm-5">
            <input type="file" name="importfile">
          </div>
          <input type="hidden" name="op" value="import_excel">
          <input type="hidden" name="WebID" value="<{$WebID}>">
          <input type="hidden" name="CateID" value="<{$cate.CateID}>">
          <button type="submit" class="btn btn-primary"><{$smarty.const._MD_TCW_IMPORT}></button>
        </div>
    </form>
  </div>
  <div class="alert alert-info">
    <{$smarty.const._MD_TCW_IMPORT_LINK}>
  </div>
<{elseif $op=="import_excel"}>

  <h2><{$smarty.const._MD_TCW_IMPORT_PREVIEW}></h2>

  <{$smarty.const._MD_TCW_IMPORT_DESCRIPT}>

  <form action="aboutus.php" method="post">
    <table class="table table-striped table-bordered table-hover table-condensed">
      <tr>
        <th><{$smarty.const._MD_TCW_MEM_NUM}></th>
        <th><{$smarty.const._MD_TCW_MEM_NAME}></th>
        <th><{$smarty.const._MD_TCW_MEM_UNICODE}></th>
        <th><{$smarty.const._MD_TCW_MEM_BIRTHDAY}></th>
        <th><{$smarty.const._MD_TCW_MEM_SEX}></th>
        <th><{$smarty.const._MD_TCW_MEM_NICKNAME}></th>
      </tr>
      <{$stud_chk_table}>
    </table>
    <input type="hidden" name="op" value="import2DB">
    <input type="hidden" name="WebID" value="<{$WebID}>">
    <input type="hidden" name="CateID" value="<{$CateID}>">
    <input type="hidden" name="newCateName" value="<{$newCateName}>">
    <button type="submit" class="btn btn-primary"><{$smarty.const._MD_TCW_IMPORT}></button>
  </form>
<{elseif $op=="export_config"}>

    <{includeq file="$xoops_rootpath/modules/tad_web/plugins/aboutus/tpls/b3/tad_web_export_config.tpl"}>
<{elseif $op=="parents_account"}>

  <script type="text/javascript" src="<{$xoops_url}>/modules/tadtools/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $("#list_mems").change(function(event) {
        var mem_name=$("#list_mems option:selected").prop('label');
        $.post("<{$xoops_url}>/modules/tad_web/plugins/aboutus/get_mems.php", { op: 'chk_unable', MemID: $('#list_mems').val(), WebID: '<{$WebID}>' , MemName:mem_name }, function(data){
            $('#unable').html(data);
        });

        $('.mem_name').html(mem_name);
        $('#step2').show();
      });
    });
  </script>
  <h3><{$smarty.const._MD_TCW_REGIST_BY_PARENTS}></h3>

  <form action="aboutus.php" id="myForm" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
    <div class="form-group">
      <label class="col-sm-3 control-label">
        <{$cate_label}>
      </label>
      <div class="col-sm-4">
        <{$cate_menu}>
      </div>
      <div class="col-sm-5">
        <select name='MemID' id='list_mems' class='form-control'>
          <option value=""><{$smarty.const._MD_TCW_ABOUTUS_SELECT_CLASS}></option>
        </select>
      </div>
    </div>
    <div id="step2" style="display:none;">
      <div class="form-group">
        <label class="col-sm-3 control-label">
          <span class="mem_name"><{$smarty.const._MD_TCW_ABOUTUS_THE_STUDENT}></span><{$smarty.const._MD_TCW_ABOUTUS_THE_STUDENT_BIRTHDAY}>
        </label>
        <div class="col-sm-9">
          <input type="text" name="MemBirthday" id="MemBirthday" onClick="WdatePicker({dateFmt:'yyyy-MM-dd' , startDate:'%y-%M-%d'})" class="validate[required] form-control" placeholder="<{$smarty.const._MD_TCW_ABOUTUS_VERIFY_BIRTHDAY}>2010-01-10">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label">
          <{$smarty.const._MD_TCW_ABOUTUS_YOUR_ARE}><span class="mem_name"><$smarty.const._MD_TCW_ABOUTUS_THE_STUDENT></span><{$smarty.const._MD_TCW_ABOUTUS_S}>
        </label>
        <div class="col-sm-9">
          <input type="text" name="Reationship" id="Reationship" class="validate[required] form-control" placeholder="<{$smarty.const._MD_TCW_ABOUTUS_REATIONSHIP_DESC}>">
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label">
          <{$smarty.const._MD_TCW_ABOUTUS_PARENT_EMAIL}>
        </label>
        <div class="col-sm-9">
          <input type="text" name="ParentEmail" id="ParentEmail" class="validate[required] form-control" placeholder="<{$smarty.const._MD_TCW_ABOUTUS_PARENT_EMAIL_DESC}>">
        </div>
      </div>

      <div class="form-group">
        <label class="col-sm-3 control-label">
          <{$smarty.const._MD_TCW_ABOUTUS_PARENT_PASSWD}>
        </label>
        <div class="col-sm-9">
          <input type="text" name="ParentPasswd" id="ParentPasswd" class="validate[required] form-control">
        </div>
      </div>

      <div class="text-center">
        <span id="unable"></span>
        <input type="hidden" name="op" value="parents_signup">
        <input type="hidden" name="WebID" value="<{$WebID}>">
        <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_NEXT}></button>
      </div>
    </div>
  </form>
<{elseif $op=="show_parents_signup"}>
  <h2><{$smarty.const._MD_TCW_ABOUTUS_PARENT_ENABLE_MAIL}></h2>
  <div class="alert alert-info">
    <{$mail_content}>
  </div>
<{elseif $op=="show_enable_parent"}>
  <{if $result=='1'}>
    <h2><{$smarty.const._MD_TCW_ABOUTUS_PARENT_ENABLE_SUCCESS}></h2>
    <div class="alert alert-success">
      <p><{$smarty.const._MD_TCW_ABOUTUS_PARENT_ENABLE_SUCCESS_CONTENT}></p>
    </div>
  <{else}>
    <h2><{$smarty.const._MD_TCW_ABOUTUS_PARENT_ENABLE_FAILED}></h2>
    <div class="alert alert-danger">
      <{$failed_content}>
    </div>
  <{/if}>
<{elseif $op=="forget_parent_passwd"}>

  <script type="text/javascript" src="<{$xoops_url}>/modules/tadtools/My97DatePicker/WdatePicker.js"></script>
  <script type="text/javascript">
    $(document).ready(function() {
      $("#list_mems").change(function(event) {
        var mem_name=$("#list_mems option:selected").prop('label');
        $('.mem_name').html(mem_name);
        $('#step3').show();
        $.post("<{$xoops_url}>/modules/tad_web/plugins/aboutus/get_mems.php", { op: 'get_reationship', MemID: $('#list_mems').val()}, function(data){
            $('#Reationship').html(data);
            if(data==''){
              $('#submit_btn').hide();
              $('#no_account').show();
            }else{
              $('#submit_btn').show();
              $('#no_account').hide();

            }
        });
      });
    });
  </script>
  <h3><{$smarty.const._MD_TCW_FORGET_PARENTS_PASSWD}></h3>

  <form action="aboutus.php" id="myForm" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
    <div class="form-group">
      <label class="col-sm-3 control-label">
        <{$cate_label}>
      </label>
      <div class="col-sm-4">
        <{$cate_menu}>
      </div>
      <div class="col-sm-5">
        <select name='MemID' id='list_mems' class='form-control'>
          <option value=""><{$smarty.const._MD_TCW_ABOUTUS_SELECT_CLASS}></option>
        </select>
      </div>
    </div>

    <div class="form-group" id="step3" style="display:none;">
      <label class="col-sm-3 control-label">
        <{$smarty.const._MD_TCW_ABOUTUS_YOUR_ARE}><span class="mem_name"><$smarty.const._MD_TCW_ABOUTUS_THE_STUDENT></span><{$smarty.const._MD_TCW_ABOUTUS_S}>
      </label>
      <div class="col-sm-4">
        <select name="Reationship" id="Reationship" class='form-control'>
        </select>
      </div>
      <div class="col-sm-5">
        <input type="hidden" name="op" value="send_parents_passwd">
        <input type="hidden" name="WebID" value="<{$WebID}>">
        <button type="submit" class="btn btn-primary" id="submit_btn"><{$smarty.const._TAD_SUBMIT}></button>
        <div class="alert alert-info" id="no_account" style="display:none;">
          <a href="aboutus.php?WebID=<{$WebID}>&op=parents_account"><{$smarty.const._MD_TCW_ABOUTUS_NO_PARENT_ACCOUNT}></a>
        </div>
      </div>
    </div>

  </form>
<{elseif $op=="show_parent"}>

  <h2><a href="aboutus.php?WebID=<{$WebID}>&CateID=<{$cate.CateID}>"><{$cate.CateName}></a></h2>
  <div style="font-size: 2em; margin: 30px auto;">
    <{if 'MemNum'|in_array:$mem_column}>
      <label class="label label-primary"><{$class_mem.MemNum}></label>
    <{/if}>
    <{$mem.MemName}>
    <{if 'MemUnicode'|in_array:$mem_column}>
      (<{$mem.MemUnicode}>)
    <{/if}>
    <{$smarty.const._MD_TCW_ABOUTUS_S}><{$parent.Reationship}>
  </div>

  <form action="aboutus.php?WebID=<{$WebID}>" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
    <div class="row">

      <div class="col-sm-3">
        <img src="<{$pic}>" alt="<{$mem.MemName}><{$smarty.const._MD_TCW_ABOUTUS_S}><{$parent.Reationship}>" class="img-responsive img-rounded">
        <br>
        <input type="file" name="upfile[]"  maxlength="1" accept="gif|jpg|png|GIF|JPG|PNG">
      </div>
      <div class="col-sm-6">

          <div class="form-group">
            <label class="col-sm-4 control-label">
              <{$smarty.const._MD_TCW_ABOUTUS_PARENT_EMAIL}>
            </label>
            <div class="col-sm-8">
              <input type="text" name="ParentEmail"  class="form-control" value="<{$parent.ParentEmail}>">
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label">
              <{$smarty.const._MD_TCW_ABOUTUS_YOUR_ARE}><{$mem.MemName}><{$smarty.const._MD_TCW_ABOUTUS_S}>
            </label>
            <div class="col-sm-8">
              <input type="text" name="Reationship"  class="form-control" value="<{$parent.Reationship}>">
            </div>
          </div>

          <div class="form-group">
            <label class="col-sm-4 control-label">
              <{$smarty.const._MD_TCW_ABOUTUS_PARENT_MODIFY_PASSWD}>
            </label>
            <div class="col-sm-8">
              <input type="text" name="ParentPasswd"  class="form-control" placeholder="<{$smarty.const._MD_TCW_ABOUTUS_PARENT_MODIFY_PASSWD_DESC}>">
            </div>
          </div>

          <div class="text-center">
            <input type="hidden" name="ParentID" value="<{$ParentID}>">
            <input type="hidden" name="op" value="save_parent">
            <input type="hidden" name="WebID" value="<{$WebID}>">
            <button type="submit" class="btn btn-primary"><{$smarty.const._TAD_SAVE}></button>
          </div>
      </div>
      <div class="col-sm-3">
         <{includeq file="$xoops_rootpath/modules/tad_web/plugins/aboutus/tpls/b3/parent_toolbar.tpl"}>
      </div>
    </div>
  </form>

  <{if $stud_scores.main_data}>
    <h2><{$mem.MemName}><{$smarty.const._MD_TCW_ABOUTUS_UPLOADED_WORKS}></h2>
    <table class="table">
      <tr>
        <th><{$smarty.const._MD_TCW_WORKS_NAME}></th>
        <th><{$smarty.const._MD_TCW_WORKS_WORKS_SCORE}></th>
        <th><{$smarty.const._MD_TCW_WORKS_WORKS_JUDGMENT}></th>
      </tr>
    <{foreach from=$stud_scores.main_data item=work}>
      <tr>
        <td><a href="works.php?WebID=<{$WebID}>&WorksID=<{$work.WorksID}>" target="_blank"><{$work.WorkName}></a></td>
        <td><{$work.mem_upload_content.WorkScore}></td>
        <td><{$work.mem_upload_content.WorkJudgment}></td>
      </tr>
    <{/foreach}>
    </table>
  <{/if}>
<{elseif $op=="mem_slot"}>

    <{includeq file="$xoops_rootpath/modules/tad_web/plugins/aboutus/tpls/b3/tad_web_mem_slot.tpl"}>
<{else}>

  <div class="row">
    <div class="col-sm-12">
       <{includeq file="$xoops_rootpath/modules/tad_web/plugins/aboutus/tpls/b3/tad_web_common_aboutus.tpl"}>
    </div>
  </div>
<{/if}>