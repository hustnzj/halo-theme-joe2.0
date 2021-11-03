<#if settings.ad_address?? && settings.ad_address != '' && settings.ad_image?? && settings.ad_image != ''>    
  <section class="joe_aside__item advert">
    <a class="joe_advert" target="_blank" rel="noopener noreferrer nofollow" href="${settings.ad_address}" title="广告">
      <img class="lazyload" width="100%" src="${lazyimg}" data-src="${settings.ad_image}" alt="广告"/>
      <span class="icon">广告</span>
    </a>
  </section>
</#if>