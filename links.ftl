<!DOCTYPE html>
<html lang="zh-CN">
<#assign title=settings.links_title!'友情链接'>
<#import "template/macro/header.ftl" as headInfo>
<@headInfo.head title="${title}" type="links"/>
<#import "template/macro/tail.ftl" as tailInfo>
<body>
    <div id="Joe">
        <#include "template/common/navbar.ftl">
        <div class="joe_container joe_main_container page-links">
            <div class="joe_main">
                <div class="joe_detail">
                    <h1 class="joe_detail__title txt-shadow">${title}</h1>
                    <article class="joe_detail__article animated fadeIn">
                      <h5>友链列表</h5>
                      <@linkTag method="list">
                        <#if links?size &gt;0>
                          <#assign colors=["#F8D800", "#0396FF", "#EA5455", "#7367F0", "#32CCBC", "#F6416C", "#32B76E", "#9F44D3", "#F55555", "#736EFE", "#E96D71", "#DE4313", "#D939CD", "#4C83FF", "#F072B6", "#C346C2", "#5961F9", "#FD6585", "#5569E8", "#FFC600", "#FA742B", "#5151E5", "#BB4E75", "#FF52E5", "#4DA037", "#15D1E2", "#F067B4", "#F067B4", "#ff9a9e", "#00f2fe", "#4facfe", "#f093fb", "#6fa3ef", "#bc99c4", "#46c47c", "#f9bb3c", "#e8583d", "#f68e5f"]>
                          <#assign nextRandom = .now?string["HHmmssSSS"]?number>
                          <ul class="joe_detail__friends">
                            <#list links as link>
                              <li class="joe_detail__friends-item">
                                <a class="contain" href="${link.url!}" target="_blank" style="background:${colors[nextRandom % colors?size]}" rel="noopener noreferrer">
                                  <span class="title">${link.name!}</span>
                                  <div class="content">
                                    <div class="desc" title="${link.description!}">${link.description!}</div>
                                    <#assign logo_default=(settings.links_logo_default?? && settings.links_logo_default!='')?then(settings.links_logo_default,RES_BASE_URL+'/source/img/icon_qiye.png')>
                                    <#assign logo=(link.logo?? && link.logo!='')?then(link.logo,logo_default)>
                                    <img width="40" height="40" class="avatar lazyload" src="${logo_default}" data-src="${logo!}" onerror="this.src=${logo_default}" alt="${link.name!}">
                                  </div>
                                </a>
                              </li>
                              <#assign nextRandom = nextRandom * 10 % 38>
                            </#list>           
                          </ul>
                        <#else>
                          <div class="joe_nodata">暂无友链</div>
                        </#if>
                      </@linkTag>
                    </article>
                    <article class="joe_detail__article animated fadeIn">
                        <h5>申请格式</h5>
                        <div class="link-requirement">
                          <p>
                              <joe-message type="info" content="博客名称 + 博客地址 + 博客Logo + 博客介绍，在留言栏目里留言即可。"></joe-message>
                          </p>
                          <blockquote class="joe_link__demo">博客名称：${blog_title!}<br>博客地址：<a href="${blog_url!}">${blog_url!}</a><br>博客介绍：${meta_description!}<br>博客Logo： <a href="${blog_logo!}">${blog_logo!}</a></blockquote>
                        </div>
                    </article>
                </div>
                <#--  <div class="joe_comment">
                  <@global.comment target=links type="links" />
                </div>  -->
            </div>
            <#include "template/common/aside.ftl">
        </div>
        <#include "template/common/footer.ftl">
        <@tailInfo.tail type="links"/> 
    </div>
</body>
</html>