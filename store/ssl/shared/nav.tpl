<nav class="navbar navbar-light bg-light navbar-expand-lg p-0">
  <div class="container">
    <span class="navbar-brand"></span>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav-ssl" aria-controls="nal-ssl" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="nav-ssl">
      <ul class="navbar-nav">
          <li class="nav-item{if empty($current)} active{/if}">
              <a class="nav-link" href="{routePath('store-product-group', $routePathSlug)}">{lang key='overview'}</a>
          </li>
          {if count($certificates.dv) > 0 || $inPreview}
              <li class="nav-item{if $current == 'dv'} active{/if}">
                  <a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'dv')}">{lang key='store.ssl.shared.dvSsl'}</a>
              </li>
          {/if}
          {if count($certificates.ov) > 0 || $inPreview}
              <li class="nav-item{if $current == 'ov'} active{/if}">
                  <a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'ov')}">{lang key='store.ssl.shared.ovSsl'}</a>
              </li>
          {/if}
          {if count($certificates.ev) > 0 || $inPreview}
              <li class="nav-item{if $current == 'ev'} active{/if}">
                  <a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'ev')}">{lang key='store.ssl.shared.evSsl'}</a>
              </li>
          {/if}
          {if count($certificates.wildcard) > 0 || $inPreview}
            <li class="nav-item{if $current == 'wildcard'} active{/if}">
                <a class="nav-link" href="{routePath('store-product-group', $routePathSlug, 'wildcard')}">{lang key='store.ssl.shared.wildcardSsl'}</a>
            </li>
          {/if}
      </ul>
    </div>
  </div>
</nav>

{if $inCompetitiveUpgrade}
    <div class="competitive-upgrade-banner" id="competitiveUpgradeBanner">
        <div class="container">
            <button class="btn btn-default btn-sm float-right" onclick="$('#competitiveUpgradeBanner').slideUp()">{lang key="dismiss"}</button>
            <h4>{lang key="store.ssl.competitiveUpgrade"}</h4>
            <p>{lang key="store.ssl.competitiveUpgradeBannerMsg" domain=$competitiveUpgradeDomain}</p>
        </div>
    </div>
{/if}
