{{ define "head" }}
<meta name="robots" content="noindex, follow">
<meta name="msapplication-tap-highlight" content="no" />
{{ $globalStyle := resources.Get "css/global.css" | resources.PostCSS | minify }}
<style>{{ $globalStyle.Content | safeCSS }}</style>
{{ $singleStyle := resources.Get "sass/cw/single.scss" | toCSS | resources.PostCSS | minify | resources.PostProcess }}
<style>{{ $singleStyle.Content | safeCSS }}</style>
{{ $clampStyle := resources.Get "sass/components/clamp.scss" | toCSS | resources.PostCSS | minify | resources.PostProcess }}
<style>{{ $clampStyle.Content | safeCSS }}</style>
{{ $imgViewerStyle := resources.Get "sass/components/new-img-viewer.scss" | toCSS | resources.PostCSS | minify | resources.PostProcess }}
<style>{{ $imgViewerStyle.Content | safeCSS }}</style>
{{ $viewerStyle := resources.Get "css/viewer.min.css" }}
<style>{{ $viewerStyle.Content | safeCSS }}</style>
{{ $relatedCoupons := resources.Get "sass/components/related-coupons.scss" | toCSS | resources.PostCSS | minify | resources.PostProcess }}
<style>{{ $relatedCoupons.Content | safeCSS }}</style>
<script>
  function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
      results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return "";
    var str = results[2].replace(/\+/g, " ");
    str = str.replace(/%(?![0-9a-fA-F]{2})/g, "%25");
    try {
      str = decodeURIComponent(str);
    } catch (error) {
      url = new URL(url);
      var params = new URLSearchParams(url.search);
      str = params.get(name);
    } finally {
      return str;
    }
  }
  
  var REGEX_MOBILE1 = /(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i;
  var REGEX_MOBILE2 = /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i;
  function isMobile (a) {
    return REGEX_MOBILE1.test(a) || REGEX_MOBILE2.test(a.substr(0, 4));
  }
</script>
{{ $axiosJs := resources.Get "js/axios.min.js" }}
<script>{{ $axiosJs.Content | safeJS }}</script>
<!--BEGIN EPJA Head-->
{{ if hugo.IsProduction }}
  {{ if int .Params.imgNum | lt 0 }}
    <!--  Start Head Code for EveryPayJoy.com -->
    <script src='https://tagan.adlightning.com/math-aids/op.js'></script>
    <script src='https://qd.admetricspro.com/js/everypayjoy/layout.js'></script>
    <script src='//www.googletagservices.com/tag/js/gpt.js'></script>
    <script src='https://qd.admetricspro.com/js/everypayjoy/cmp.js'></script>
    <script src='https://qd.admetricspro.com/js/everypayjoy/uspcmp.js'></script>
    <script src="//cdn.districtm.ca/merge/merge.194768.js"></script>
    <script src='https://qd.admetricspro.com/js/everypayjoy/prebid.js'></script>
    <script src='https://qd.admetricspro.com/js/everypayjoy/engine.js'></script>
    <script data-ad-client="ca-pub-8460394618887212" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <!--  End Header Code for EveryPayJoy.com -->
  {{ else }}
    <script data-cfasync="false" type="text/javascript">
    (function(w, d) {
      var s = d.createElement('script');
      s.src = '//cdn.adpushup.com/41631/adpushup.js';
      s.type = 'text/javascript'; s.async = true;
      (d.getElementsByTagName('head')[0] || d.getElementsByTagName('body')[0]).appendChild(s);
    })(window, document);
    </script>
  {{ end }}
{{ end }}
<!--END EPJA Head-->
{{ end }}

{{ define "header" }}
<style>
  .disclaimer-wrap {
    padding: 10px;
    display: flex;
    align-items: center;
    background: #ffffff;
  }
  .disclaimer {
    font-family: Noto Sans;
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 18px;
    letter-spacing: -0.408px;
    color: #59575c;
    text-align: left;
  }
  @media only screen and (max-width: 960px) {
    .disclaimer-wrap {
      padding: 8px;
    }
  }

  .l-nav {
    position: relative;
  }

  .l-nav img {
    max-width: 138px;
    max-height: 30px;
    object-fit: contain;
  }

  /*
    mobile <=767
    tablet >=768 && <=1024
    desktop >= 1025 
  */

  .l-nav-menu {
    position: relative;
    display: none;
  }

  .l-nav-menu-wrap {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    padding: .5rem 0;
    background-color: #fff;
    box-shadow: 0 8px 16px rgba(10,10,10,.1);
    z-index: 5;
  }
  
  .l-nav-menu.is-active {
    display: block;
  }

  @media screen and (min-width: 768px) {
    .l-nav {
      border-bottom: 1px solid #DADADA;
    }
  }
</style>
{{ if .Params.isFirstImg }}
<div class="disclaimer-wrap">
  <div class="disclaimer">
    Disclaimer: <b>EveryPayJoy</b> is <b>not</b> affiliated with the manufacturers or brands
    of the products listed on this website, and in no way claim to represent or
    own their trademarks, logos, or products.
  </div>
  <span class="disclaimer-close icon" style="width: 36px; height: 36px; flex-shrink: 0;">
    <svg style="width:24px;height:24px" viewBox="0 0 24 24">
      <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
    </svg>
  </span>
</div>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var $disclaimerWrap = document.querySelector(".disclaimer-wrap");

    const isDisclaimerConfirmed = localStorage.getItem("DISCLAIMER");
    if (isDisclaimerConfirmed) {
      $disclaimerWrap.style.display = "none";
    } else {
      setTimeout(function() {
        $disclaimerWrap.style.display = "none";
      }, 5000);

      var $disclaimerClose = $disclaimerWrap.querySelector(".disclaimer-close");
      
      $disclaimerClose.addEventListener('click', function() {
        localStorage.setItem("DISCLAIMER", "CONFIRMED");
        $disclaimerWrap.style.display = "none";
      });
    }
  });
</script>
{{ end }}

{{ if hugo.IsProduction }}
  {{ if int .Params.imgNum | lt 999 }}
  <div class="page-container">
    <!--BEGIN EPJA Video-->
    <div class="my-3 px-3 epja-container">
      <div class="has-text-grey-light is-size-7 is-hidden-desktop" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT - CONTINUE READING BELOW</div>
      <div class="epja-video-1">
        <script src="https://player.anyclip.com/anyclip-widget/lre-widget/prod/v1/src/lre.js" pubname="altalabscom" widgetname="0016900002cPuuh_6509"></script>
      </div>
      <div class="epja-video-p"></div>
    </div>
    <!--END EPJA Video-->
  </div>
  {{ end }}
  {{ if int .Params.imgNum | eq 1 }}
  <div class="page-container">
  <!--BEGIN EPJA Above-->          
  <div id="epja-above" class="my-3 px-3 epja-container">
    <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT - CONTINUE READING BELOW</div>
    <!-- /192633929/everypayjoy-728x90-ATF-Top-Slideshow -->
    <div id='div-gpt-ad-1611943709594-0' class="epja-above epja-target">
      <script>
        googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611943709594-0'); });
      </script>
    </div>
  </div>
  </div>
  <!--END EPJA Above-->
  {{ end }}
{{ end }}

<header class="l-nav is-flex is-justify-content-space-between is-align-items-center">
  <div class="is-flex is-align-items-center is-flex-grow-0 is-flex-shrink-0">
    <div class="px-3 py-2 is-flex">
      <img
        src="{{ .Params.store.logo }}"
        alt="{{ .Params.store.name }} logo"
        loading="lazy" 
        decoding="async"
      />
    </div>
    <div class="l-footnote" style="color: #59575c;">
      Valid {{ .Params.seFmt }}
    </div>
  </div>
  <div class="l-body is-hidden-mobile" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">{{ .Params.imgNum }}/{{ len .Params.images }}</div>
  <a
    role="button"
    class="ml-0 navbar-burger is-block"
    aria-label="menu"
    aria-expanded="false"
    data-target="nav-menu"
    style="flex-shrink: 0;"
  >
    <span aria-hidden="true"></span>
    <span aria-hidden="true"></span>
    <span aria-hidden="true"></span>
  </a>
</header>
<div class="l-nav-menu" id="nav-menu">
  <div class="l-nav-menu-wrap">
    <a href="/b/" class="navbar-item has-text-weight-bold{{ if eq .Section `b` }} has-background-light{{ end }}">Coupons</a>
    <a href="/k/" class="navbar-item has-text-weight-bold{{ if eq .Section `k` }} has-background-light{{ end }}">Tips</a>
    <a href="/stores/" class="navbar-item has-text-weight-bold{{ if eq .Section `stores` }} has-background-light{{ end }}">All Stores</a>
    <a href="/weeklyads/" class="navbar-item has-text-weight-bold{{ if eq .Section `weeklyads` }} has-background-light{{ end }}">Weekly Ads</a>
    <a href="/sweepstakes/" class="navbar-item has-text-weight-bold{{ if eq .Section `sweepstakes` }} has-background-light{{ end }}">Sweepstakes</a>
  </div>
</div>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);
    if ($navbarBurgers.length > 0) {
      $navbarBurgers.forEach(function(el) {
        el.addEventListener('click', function() {
          if (isMobile(navigator.userAgent)) {
            var $menu = document.querySelector(".page-container > .page-wrap > div.right");
            $menu.classList.toggle('is-active');
          } else {
            var target = el.dataset.target;
            var $target = document.getElementById(target);
            el.classList.toggle('is-active');
            $target.classList.toggle('is-active');
          }
        });
      });
    }
  });
</script>
{{ end }}

{{ define "main" }}
{{ $prevPage := "####" }}
{{ if int .Params.imgNum | lt 1 }}
  {{ if int .Params.imgNum | eq 2 }}
    {{ $prevPage = delimit (slice "/w/" .Params.weeklyadId "/") "" }}
  {{ else }}
    {{ $prevPage = delimit (slice "/w/" .Params.weeklyadId "/" (sub .Params.imgNum 1) "/") "" }}
  {{ end }}
{{ end }}

{{ $nextPage := delimit (slice "/w/" .Params.weeklyadId "/" (add .Params.imgNum 1) "/") "" }}
{{ if len .Params.images | eq (int .Params.imgNum) }} {{ $nextPage = "https://www.everypayjoy.com/home" }} {{ end }}

{{ if .Params.storeIsDmcaRemoval }}
<main class="container">
  {{ partial "components/copyrights-tip.html" (dict "url" .Params.storeWeeklyAdsUrl "text" .Params.copyrightsTipText) }}
</main>
{{ end }}
<main class="container{{ if .Params.storeIsDmcaRemoval }} is-hidden{{ end }}">
  <div class="page-container">
    <div class="page-wrap">
      <div class="left">
        <!--BEGIN EPJA Above-->
        {{ if hugo.IsProduction }}
        {{ if int .Params.imgNum | lt 1 }}
        <div id="epja-above epja-target" class="my-3 px-3 epja-container">
          <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT - CONTINUE READING BELOW</div>
          <!-- /192633929/everypayjoy-728x90-ATF-Top-Slideshow -->
          <div id='div-gpt-ad-1611943709594-0' class="epja-above">
            <script>
              googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611943709594-0'); });
            </script>
          </div>
        </div>
        {{ end }}
        {{ end }}
        <!--END EPJA Above-->
      
        {{ $imgSrc := sub .Params.imgNum 1 | int | index .Params.images }}
        {{ $imgAlt := delimit (slice .Params.storeName "weekly ad - page" .Params.imgNum) " " }}
        <div class="swipe-container img-block is-flex-tablet is-align-items-center">
          <div class="img-action">
            <button class="zoomin px-0 py-0 button is-light has-background-grey is-radiusless" style="width: 26px;height: 26px;">
              <span class="icon has-text-white">
                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                  <path fill="currentColor" d="M19,13H13V19H11V13H5V11H11V5H13V11H19V13Z" />
                </svg>
              </span>
            </button>
            <button class="zoomout px-0 py-0 button is-light has-background-grey is-radiusless" style="width: 26px;height: 26px;">
              <span class="icon has-text-white">
                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                  <path fill="currentColor" d="M19,13H5V11H19V13Z" />
                </svg>
              </span>
            </button>
          </div>
          {{ if .Params.isFirstImg }}
          <div class="notification-wrap by13 is-flex is-hidden-touch">
            <div class="l-notification large">Scroll mouse wheel to zoom</div>
          </div>
          <div class="notification-wrap by13 is-flex is-hidden-desktop">
            <div class="l-notification large">Pinch to zoom</div>
          </div>
          {{ end }}
          {{ if not .Params.isFirstImg }}
          <div class="notification-wrap is-flex">
            <div class="l-notification" style="padding: 8px 24px; min-width: 80px; min-height: 36px;">
              {{ .Params.imgNum }}/{{ len .Params.images }}
            </div>
          </div>
          {{ end }}
          <div class="mr-2 img-prev">
            {{ if .Params.isFirstImg }}
            <a class="prev-store px-0 button is-light has-background-grey-light is-radiusless" style="width: 40px;height: 100px;">
              <span class="icon has-text-white">
                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                  <path fill="currentColor" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
                </svg>
              </span>
            </a>
            {{ else }}
            <a href="{{ $prevPage }}" class="px-0 button is-light has-background-grey-light is-radiusless weeklyads-prev-btn" style="width: 40px;height: 100px;">
              <span class="icon has-text-white">
                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                  <path fill="currentColor" d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z" />
                </svg>
              </span>
            </a>
            {{ end }}
          </div>
          {{ partial "components/new-img-viewer.html" (dict "customClass" "mt-2 is-flex-grow-1" "imgSrc" $imgSrc "imgAlt" $imgAlt "hasAdCover" false) }}
          <div class="ml-2 img-next">
            {{ if .Params.isLastImg }}
            <a class="next-store px-0 button is-danger is-radiusless weeklyads-next-btn" style="width: 40px;height: 100px;">
              <span class="icon">
                <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                  <path fill="currentColor" d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                </svg>
              </span>
            </a>
            {{ else }}
              {{ if false }}
              <a data-nextpage="{{ $nextPage }}" class="px-0 button is-danger is-radiusless weeklyads-next-btn" style="width: 40px;height: 100px;">
                <span class="icon">
                  <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                  </svg>
                </span>
              </a>
              <script>
                document.addEventListener('DOMContentLoaded', function() {
                  var $weeklyadsNextBtn = document.querySelector(".weeklyads-next-btn");
                  if ($weeklyadsNextBtn) {
                    $weeklyadsNextBtn.addEventListener('click', function() {
                      var $target = document.querySelector(".ad-cover");
                      if ($target.classList.contains("is-active")) {
                        document.location.assign($weeklyadsNextBtn.dataset.nextpage);
                      } else {
                        $target.style.display = "flex";
                        setTimeout(function() {
                          $target.classList.toggle('is-active');
                          googletag.cmd.push(function() { googletag.pubads().refresh(); });
                        }, 0);
                      }              
                    });
                  }
  
                  var $skipAdBtn = document.querySelector(".skip-ad-btn");
                  if ($skipAdBtn && $weeklyadsNextBtn) {
                    $skipAdBtn.addEventListener('click', function() {
                      document.location.assign($weeklyadsNextBtn.dataset.nextpage);
                    });
                  }
                });
              </script>
              {{ else }}
              <a href="{{ $nextPage }}" class="px-0 button is-danger is-radiusless weeklyads-next-btn" style="width: 40px;height: 100px;">
                <span class="icon">
                  <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                    <path fill="currentColor" d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
                  </svg>
                </span>
              </a>
              {{ end }}
            {{ end }}
          </div>
        </div>

        <script>
          var $zoomin = null
          var $zoomout = null
          var $expand = null

          var viewer = null;
          var $img = null;
          var isInitialZoom = false;

          var imageRect = {};
          var imgInitialWidth = 0;
          var imgInitialHeight = 0;
          var imgNaturalWidth = 0;
          var imgNaturalHeight = 0;

          function createViewer(cb) {
            var $imgContainers = [].slice.call(
              document.querySelectorAll(".l-img-container")
            );
            if ($imgContainers.length > 0) {
              $imgContainers.forEach(function (el) {
                $img = el.querySelector("img");
                if ($img) {
                  imageRect = getElementRect($img);
                  imgInitialWidth = imageRect.width;
                  imgInitialHeight = imageRect.height;
                  imgNaturalWidth = imageRect.naturalWidth;
                  imgNaturalHeight = imageRect.naturalHeight;
                  
                  var x = imageRect.left - 12;
                  var ratio = imgInitialHeight / imgNaturalHeight;

                  viewer = new Viewer($img, {
                    inline: true,
                    backdrop: false,
                    button: false,
                    navbar: false,
                    title: false,
                    toolbar: false,
                    slideOnTouch: false,
                    transition: false,
                    zoomOnWheel: false,
                    toggleOnDblclick: false,
                    minZoomRatio: ratio / 2,
                    maxZoomRatio: 3,
                    viewed: function () {
                      $img.classList.add("is-invisible");
                      isInitialZoom = true;

                      var mq = window.matchMedia("only screen and (max-width: 764px)");
                      if (mq.matches) {
                        // mobile
                        viewer.zoomTo(ratio);
                        viewer.moveTo(x, 0);
                      } else {
                        // tablet
                        var ratioX =
                          viewer.viewerData.width / viewer.imageData.naturalWidth;
                        var ratioY =
                          viewer.viewerData.height / viewer.imageData.naturalHeight;
                        
                        var isHorizontal =
                          viewer.imageData.naturalWidth > viewer.imageData.naturalHeight;
                        var ratio1 = isHorizontal ? ratioY : ratioX;

                        // too tall
                        var is30p = viewer.imageData.naturalHeight*ratioX > viewer.viewerData.height * 2.5;

                        if(!isHorizontal && is30p) {
                          viewer.zoomTo(ratio1 / 2);
                          viewer.moveTo(viewer.imageData.left, 0);
                        } else {
                          viewer.zoomTo(ratio1);
                          viewer.moveTo(x, 0);
                        }
                      }

                      if (typeof cb === 'function') cb();
                    },
                    zoomed: function (e) {
                      if (!isInitialZoom && e.detail.ratio === ratio) {
                        toggleViewer();
                      }
                      isInitialZoom = false;

                      // if (e.detail.ratio >= 3) {
                      //   $zoomin.style.backgroundColor = "#bdbdbd";
                      // } else {
                      //   $zoomin.style.backgroundColor = "#eb5757";
                      // }

                      // if (e.detail.ratio === ratio) {
                      //   $zoomout.style.backgroundColor = "#bdbdbd";
                      // } else {
                      //   $zoomout.style.backgroundColor = "#eb5757";
                      // }
                    },
                  });
                }
              });
            }
          }

          function destroyViewer() {
            if (!viewer) return;
            if (typeof viewer.destroy !== 'function') return;
            $img.classList.remove("is-invisible");
            viewer.destroy();
            viewer = null;
            isInitialZoom = false;
          }

          function toggleViewer() {
            if (viewer) return destroyViewer()
            return createViewer()
          }

          function getElementRect(el) {
            var rect = el.getBoundingClientRect();

            var obj = {};

            for (var key in rect) {
              if (typeof rect[key] !== 'function') {
                obj[key] = rect[key];
              }
            }
            
            obj.naturalWidth = el.naturalWidth;
            obj.naturalHeight = el.naturalHeight;
            
            return obj;
          }

          document.addEventListener('DOMContentLoaded', function() {
            if (isMobile(navigator.userAgent)) {
              $zoomin = document.querySelector('.img-action .zoomin');
              function handleImgZoomin(e) {
                e.stopPropagation();
                if (!viewer) { 
                  createViewer(function () {
                    var ratio = viewer.imageData.ratio + 0.1;
                    viewer.zoomTo(ratio);
                  });
                } else {
                  var ratio = viewer.imageData.ratio + 0.1;
                  viewer.zoomTo(ratio);
                }
              }
              $zoomin.addEventListener('click', handleImgZoomin);

              $zoomout = document.querySelector('.img-action .zoomout');
              function handleImgZoomout(e) {
                e.stopPropagation();
                if (!viewer) { 
                  createViewer(function () {
                    var ratio = viewer.imageData.ratio - 0.1;
                    viewer.zoomTo(ratio);
                  });
                } else {
                  var ratio = viewer.imageData.ratio - 0.1;
                  viewer.zoomTo(ratio);
                }
              }
              $zoomout.addEventListener('click', handleImgZoomout);

              $expand = document.querySelector(".l-img-container");
              function handleImgexpand() {
                var mq = window.matchMedia("only screen and (max-width: 764px)");
                if (mq.matches) {
                  $expand.style.height = "480px";
                } else {
                  $expand.style.height = "520px";
                }
                if (viewer) {
                  destroyViewer()
                }
              }
              setTimeout(handleImgexpand, 2000);

              var _C = document.querySelector('.swipe-container');
              var _Left = document.querySelector('.left');

              // setTimeout(function () {
                var manager = new Hammer.Manager(_C);
                // Create Pinch recognizer
                var pinch = new Hammer.Pinch();
                // Add the recognizer to the manager
                manager.add(pinch);
                manager.get('pinch').set({ enable: true });
                // Subscribe to desired event
                var isInitialPinch = false;
                manager.on('pinchstart', function(e) {
                  if (!viewer) {
                    toggleViewer()
                    isInitialPinch = true;
                  }
                });
  
                manager.on('pinchmove', function(e) {
                  if (viewer && isInitialPinch) {
                    var nextHeight = imgInitialHeight * e.scale;
                    var ratio = nextHeight / imgNaturalHeight;
                    viewer.zoomTo(ratio);
                  }
                });

                manager.on('pinchend', function(e) {
                  isInitialPinch = false;
                });
              // }, IMG_DELAY * 1000);

              var lmanager = new Hammer.Manager(_Left);
              // Create Swipe recognizer
              var Swipe = new Hammer.Swipe({ direction: Hammer.DIRECTION_HORIZONTAL });
              // Add the recognizer to the manager
              lmanager.add(Swipe);
              // Subscribe to a desired event
              lmanager.on('swipeleft', function(e) {
                if (!viewer) {
                  {{ if .Params.isLastImg }}
                  return nextStore();
                  {{ else }}
                  var url = {{ $nextPage }}
                  document.location.assign(url);
                  {{ end }}
                }
              });

              lmanager.on('swiperight', function(e) {
                if (!viewer) {
                  {{ if .Params.isFirstImg }}
                  return prevStore();
                  {{ else }}
                  var url = {{ $prevPage }}
                  document.location.assign(url);
                  {{ end }}
                }
              });
            }
          });
        </script>

        <!--BEGIN EPJA Below-->
        {{ if hugo.IsProduction }}
        <div class="my-3 px-3 epja-container">
          <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT - CONTINUE READING BELOW</div>
          <!-- /192633929/everypayjoy-728x90-ATF-Bottom-Slideshow -->
          <div id='div-gpt-ad-1611943827097-0' class="epja-below">
            <script>
              googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611943827097-0'); });
            </script>
          </div>
        </div>
        {{ end }}
        <!--END EPJA Below-->
        
        <div class="my-4 next-btn-wrap">
          <a href="{{ $nextPage }}" class="button is-danger is-rounded is-fullwidth weeklyads-next-btn">
            <span class="l-title-2 has-text-white is-uppercase has-text-weight-semibold">
              Next
            </span>
            <span class="icon">
              <svg style="width:24px;height:24px" viewBox="0 0 24 24">
                <path fill="currentColor" d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z" />
              </svg>
            </span>
          </a>
        </div>
        
        {{ if hugo.IsProduction }}
        <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT - CONTINUE READING BELOW</div>
        <div class="my-3 px-3 is-flex-tablet is-justify-content-space-between">
          <!--BEGIN EPJA btn-middle-1-->
          <div class="epja-container">
            <!-- /192633929/everypayjoy-300x250-BTF-Left -->
            <div id='div-gpt-ad-1611944073573-0' class="epja-middle">
              <script>
                googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611944073573-0'); });
              </script>
            </div>
          </div>
          <!--END EPJA btn-middle-1-->

          <!--BEGIN EPJA btn-middle-2-->
          <div class="is-hidden-mobile epja-container">
            <!-- /192633929/everypayjoy-300x250-BTF-Right -->
            <div id='div-gpt-ad-1611944142121-0' class="epja-middle-2">
              <script>
                googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611944142121-0'); });
              </script>
            </div>
          </div>
          <!--END EPJA btn-middle-2-->
        </div>
        {{ end }}
        
        <h1 class="mt-5 px-2 l-weeklyad-title">{{ .Title }}</h1>
      
        {{ partial "components/clamp.html" (dict "customClass" "mt-5 px-3" "text" .Params.wsummary) }}
      
        <!--BEGIN EPJA Footer-->
        {{ if hugo.IsProduction }}
        <div class="my-3 px-3 epja-container">
          <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT - CONTINUE READING BELOW</div>
          <!-- /192633929/everypayjoy-728x90-BTF -->
          <div id='div-gpt-ad-1611944036304-0' class="epja-footer">
            <script>
              googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611944036304-0'); });
            </script>
          </div>
        </div>
        {{ end }}
        <!--END EPJA Footer-->
      </div>
      <div class="right">
        {{ if hugo.IsProduction }}
        <!--BEGIN EPJA Side 1-->
        <div class="my-2 epja-side-container is-hidden-touch">
          <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT</div>
          <!-- /192633929/everypayjoy-300x250-Sidebar1 -->
          <div id='div-gpt-ad-1611943866179-0' class="epja-side-1">
            <script>
              googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611943866179-0'); });
            </script>
          </div>
        </div>
        <!--END EPJA Side 1-->
        {{ if int .Params.imgNum | lt 1 }}
        <!--BEGIN EPJA Side 2-->
        <div class="my-2 epja-side-container is-hidden-touch">
          <!-- /192633929/everypayjoy-300x250-Sidebar2 -->
          <div id='div-gpt-ad-1611943942638-0' class="epja-side-2">
            <script>
              googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611943942638-0'); });
            </script>
          </div>
        </div>
        <!--END EPJA Side 2-->
        {{ end }}
        {{ end }}

        <div class="mt-2">
          {{ if .Params.currentWeeklyads }}
          <h3 class="l-headline has-text-text">
            <span>Current {{ .Params.storeName }} Ads</span>
            <span class="menu-close is-hidden-tablet is-pulled-right icon has-text-black" style="width:20px;height:20px">
              <svg style="width:20px;height:20px" viewBox="0 0 24 24">
                <path fill="currentColor" d="M19,6.41L17.59,5L12,10.59L6.41,5L5,6.41L10.59,12L5,17.59L6.41,19L12,13.41L17.59,19L19,17.59L13.41,12L19,6.41Z" />
              </svg>
            </span>
            <script>
              document.addEventListener('DOMContentLoaded', function() {
                var $menuCloses = [].slice.call(document.querySelectorAll('.menu-close'));
                if ($menuCloses.length > 0) {
                  $menuCloses.forEach(function(el) {
                    el.addEventListener('click', function() {
                      if (isMobile(navigator.userAgent)) {
                        var $menu = document.querySelector(".page-container > .page-wrap > div.right");
                        $menu.classList.remove('is-active');
                      }
                    });
                  });
                }
              });
            </script>
          </h3>
          {{ end }}
          <div id="current-weeklyads" class="mt-3 columns is-gapless is-multiline">
            <div class="loading mb-2 column is-12">
              <div class="content">
                <p>Loading...</p>
              </div>
            </div>
            {{ range .Params.currentWeeklyads }}
            <div class="mb-2 column is-12 is-hidden">
              <a href="/w/{{ .id }}/" class="l-w-list">
                <div class="img-wrap">
                  <img class="l-image-contain" src="{{ .logo }}" alt="{{ .title }}" loading="lazy" decoding="async" />
                </div>
                <div class="content-wrap">
                  <h3 class="l-subheadline has-text-weight-semibold">{{ .title }}</h3>
                  <div class="l-caption-2 highlight">{{ .highlight }}</div>
                </div>
              </a>
            </div>
            {{ end }}
          </div>
        </div>

        <!--BEGIN EPJA Side 3-->
        <div class="my-2 epja-side-container is-hidden-desktop">
          <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT</div>
          <!-- /192633929/everypayjoy-300x250-Sidebar3 -->
          <div id='div-gpt-ad-1611943977731-0' class="epja-side-3">
            <script>
              googletag.cmd.push(function() { googletag.display('div-gpt-ad-1611943977731-0'); });
            </script>
          </div>
        </div>
        <!--END EPJA Side 3-->

        <div class="mt-4">
          <h3 class="l-headline has-text-text">
            <span>For You</span>
          </h3>
          <div id="recommendation-weeklyads" class="mt-3 columns is-gapless is-multiline">
            <div class="mb-2 column is-12">
              <div class="content">
                <p>Loading...</p>
              </div>
            </div>
          </div>
        </div>
        
        {{ if hugo.IsProduction }}          
          {{ if int .Params.imgNum | lt 0 }}
          <!--BEGIN EPJA Side 2-->
          <div class="my-2 epja-side-container is-hidden-touch">
            <div class="has-text-grey-light is-size-7" style="padding-bottom: 5px; text-align-last: center;">ADVERTISEMENT</div>
            <script src="https://player.anyclip.com/anyclip-widget/lre-widget/prod/v1/src/lre.js" pubname="altalabscom" widgetname="0016900002cPuuh_6509"></script>
          </div>
          <!--END EPJA Side 2-->
          {{ end }}
        {{ end }}
        
      </div>
    </div>
  </div>

  <div class="is-hidden">
    {{ partial "components/clamp.html" (dict "customClass" "mt-5 px-2" "text" .Params.Description) }}
    {{ partial "components/related-coupons.html" (dict "customClass" "mt-5 px-2" "storeName" .Params.storeName "storeSlug" .Params.storeSlug "storeCoupons" .Params.storeCoupons "utmSource" .Section) }}
    <div class="mt-6 px-2 w-store-info">
      <h3 class="l-footnote has-text-weight-semibold">About {{ .Params.storeName }}</h3>
      <article class="mt-1 l-footnote">{{.Params.storeDescription}}</article>
      <h3 class="mt-4 l-footnote has-text-weight-semibold">Source</h3>
      <a
        class="mt-1 l-footnote"
        href="{{ .Params.storeWeeklyAdsUrl }}"
        rel="nofollow noopener"
        target="_blank"
      >
        {{ .Params.storeName }} Weekly Ad
      </a>
    </div>
  </div>
</main>
{{ end }}

{{ define "scripts" }}
{{ $opts := dict "target" "es5" "minify" true }}
{{ $clampJs := resources.Get "js/components/clamp.js" | js.Build $opts }}
<script>{{ $clampJs.Content | safeJS }}</script>
{{ $viewerJs := resources.Get "js/viewer.min.js" }}
<script>{{ $viewerJs.Content | safeJS }}</script>
{{ $imgViewerJs := resources.Get "js/components/new-img-viewer.js" | js.Build $opts }}
<script>{{ $imgViewerJs.Content | safeJS }}</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js" integrity="sha512-UXumZrZNiOwnTcZSHLOfcTs0aos2MzBWHXOHOuB0J/R44QB0dwY5JgfbvljXcklVf65Gc4El6RjZ+lnwd2az2g==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" integrity="sha512-qTXRIMyZIFb8iQcfjXWCO8+M5Tbc38Qi5WzdPOYZHIlZpzBHG3L3by84BBBOiRGiEb7KKtAOAs5qYdUiZiQNNQ==" crossorigin="anonymous"></script>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var $notifications = [].slice.call(document.querySelectorAll(".l-notification"));
    if ($notifications.length > 0) {
      $notifications.forEach(function (el) {
        // el.classList.add("is-hidden");

        // setTimeout(function() {
        //   el.classList.remove("is-hidden");
        // }, IMG_DELAY * 1000);

        setTimeout(function() {
          el.classList.add("is-hidden");
        }, 3000);
      });
    }
  });
</script>
<script>
  function share() {
    var title = "EveryPayJoy";
    var text = "Check this weekly ads on EveryPayJoy:";
    var url = location.href;

    if (navigator.share) {
      navigator.share({ title: title, text: text, url: url });
    } else {
      var link = "https://www.facebook.com/sharer/sharer.php?u=" + url;
      window.open(link);
    }
  }

  function genStoreSlug(name, id) {
    return name
    .replace(/\s/g, "-")
    .replace(/&/g, "and")
    .replace(/\+/g, "and")
    .replace(/@/g, "at")
    .replace(/[^-A-Za-z0-9]/g, "")
    .replace(/-{2,}/g, "-")
    .toLowerCase() + '_' + id;
  }

  function prevStore() {
    axios.get('https://app.sprucejoy.com/api/v2/store-weeklyads/{{.Params.storeId}}/prev')
      .then(function (response) {
        var store = response.data.data;
        var url = '/cw/' + genStoreSlug(store.name, store.id) + '/'
        document.location.assign(url);
      });
  }

  function nextStore() {
    {{ if and .Params.isLastImg .Params.nextWeeklyad }}
    var nextSequence = localStorage.getItem("NEXT_SEQUENCE");
    if (nextSequence) {
      nextSequence = JSON.parse(nextSequence)
      var idx = nextSequence.indexOf({{ .Params.weeklyadId }})
      if (idx === -1) {
        localStorage.setItem("NEXT_SEQUENCE", {{ .Params.nextSequence }});
        var url = "/w/{{ .Params.nextWeeklyad.id | safeJS }}/"
        document.location.assign(url);
      } else if (idx === nextSequence.length - 1) {
        axios.get('https://app.sprucejoy.com/api/v2/store-weeklyads/{{.Params.storeId}}/next')
          .then(function (response) {
            var store = response.data.data;
            var url = '/cw/' + genStoreSlug(store.name, store.id) + '/'
            localStorage.removeItem('NEXT_SEQUENCE');
            document.location.assign(url);
        });
      } else {
        var url = "/w/" + nextSequence[idx + 1] + "/"
        document.location.assign(url);
      }
    } else {
      localStorage.setItem("NEXT_SEQUENCE", {{ .Params.nextSequence }});
      var url = "/w/{{ .Params.nextWeeklyad.id | safeJS }}/"
      document.location.assign(url);
    }
    {{ else }}
    axios.get('https://app.sprucejoy.com/api/v2/store-weeklyads/{{.Params.storeId}}/next')
      .then(function (response) {
        var store = response.data.data;
        var url = '/cw/' + genStoreSlug(store.name, store.id) + '/'
        document.location.assign(url);
    });
    {{ end }}
  }

  function getRecommendation() {
    var formCopy = {
      category: "recommendation",
      ip: "",
    };

    axios.get('https://api.apply-now.io/api/v1/ip/current')
      .then(function (response) {
        var ip = response.data.ip;
        if (!ip) throw new Error("Unable to get ip, please try again later.");
        formCopy.ip = ip;
        return axios.get('https://app.sprucejoy.com/api/v2/weeklyads', { params: formCopy })
      })
      .then(function(res) {
        var data = res.data.data.filter(function(i) {
          return i.store_id !== {{ .Params.storeId }}
        }).slice(0, 5);
        data = processData(data);
        updateRecommendationDom(data);
      })
      .catch(function (error) {
        console.log(error);
      });
  }

  function processTitle(v) {
    var re = /\(\w+\s\d+\s-\s\w+\s\d+,\s\d+\)/;
    return v.replace(re, "");
  }  

  function processData(data) {
    return data.map(function(i) {
      var output = {};
      output.id = String(i.id);
      output.slug = genStoreSlug(i.store.name, i.store_id);
      output.title = processTitle(i.title);

      var s = moment.utc(i.week_begin, "YYYY-MM-DD HH:mm:ss").format("MMMM D");
      var e = moment.utc(i.week_end, "YYYY-MM-DD HH:mm:ss").format("MMMM D");
      output.highlight = "Valid " + s + " - " + e;

      output.logo = i.store.logo || "";

      return output;
    });
  }

  function updateRecommendationDom(data) {
    var dom = data.map(function (i) {
      var str =
        '<div class="mb-2 column is-12"><a href="/cw/' +
        i.slug +
        '/" class="l-w-list"><div class="img-wrap"><img class="l-image-contain" src="' +
        i.logo +
        '" alt="' +
        i.title +
        '" loading="lazy" decoding="async" /></div><div class="content-wrap"><h3 class="l-subheadline has-text-weight-semibold">' +
        i.title +
        '</h3><div class="l-caption-2 highlight">' +
        i.highlight +
        "</div></div></a></div>";
      return str;
    }).join('');

    var $rw = document.getElementById('recommendation-weeklyads');
    $rw.innerHTML = dom;
  }

  function removeElement(el) {
    if (typeof el.remove === "function") {
      el.remove();
    } else if (el.parentNode && typeof el.parentNode.removeChild === "function") {
      el.parentNode.removeChild(el);
    }
  }

  function simulate() {
    var $cw = document.getElementById('current-weeklyads');
    var $hiddens = [].slice.call($cw.querySelectorAll('.is-hidden'));
    var $loading = $cw.querySelector(".loading");

    $loading.classList.toggle('is-hidden');
    removeElement($loading);

    $hiddens.forEach(function(el) {
      el.classList.toggle('is-hidden');
    });
  }

  document.addEventListener('DOMContentLoaded', function() {
    {{ if int .Params.imgNum | lt 1 }}
    var $epjaAbove = document.getElementById('epja-above');
    if ($epjaAbove) {
      window.scrollTo(0, $epjaAbove.getBoundingClientRect().top);
      var $ads = $epjaAbove.querySelector('.epja-target');
      
      var checkAdsRectTimer = setInterval(checkAdsRect, 50);
      function checkAdsRect() {
        var mq = window.matchMedia("only screen and (max-width: 768px)");
        var rect = $ads.getBoundingClientRect();
        if (mq.matches && rect.height > 0) {
          clearInterval(checkAdsRectTimer);
          window.scrollTo(0, rect.height / 3 + rect.top + window.scrollY);
        }
      }
    }
    {{ end }}
    setTimeout(function() {
      simulate();
      getRecommendation();
    }, 4500);
    var $prevStores = [].slice.call(document.querySelectorAll('.prev-store'));
    var $nextStores = [].slice.call(document.querySelectorAll('.next-store'));

    if ($prevStores.length > 0) {
      $prevStores.forEach(function(el) {
        el.addEventListener('click', prevStore);
      });
    }

    if ($nextStores.length > 0) {
      $nextStores.forEach(function(el) {
        el.addEventListener('click', nextStore);
      });
    }
  });
</script>
{{ end }}
