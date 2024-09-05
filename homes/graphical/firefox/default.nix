{ pkgs, ... }:

{

  programs.firefox = {

    enable = true;

    policies = {

      DefaultDownloadDirectory = "\${home}/Downloads";
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      NoDefaultBookmarks = true;

    };

    profiles.default.extensions = with pkgs.nur.repos.rycee.firefox-addons; [

      ublock-origin
      privacy-badger
      decentraleyes
      duckduckgo-privacy-essentials
      disconnect
      tabliss

    ];

    profiles.default = {

      extraConfig = ''
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        user_pref("svg.context-properties.content.enabled", true);
        user_pref("layout.css.has-selector.enabled", true);

      '';

      userChrome = ''

:root{--WindowDraggingFromNewtabButton: no-drag}  /*  For windows  *//*
:root{--WindowDraggingFromNewtabButton: drag !important}  /* For linux */

/*  #reload-button, #stop-button{display:none !important}  /*  Removes the reload/stop button  */

/*  #back-button, #forward-button{display: none !important}  /*  Removes the forward/back button  */

/*  .tab-close-button{display: none !important}  /*  Removes the x-button from the tabs  */

/*  #tabs-newtab-button, #new-tab-button{opacity: 0 !important}  /*  Hide newtab button  */

#navigator-toolbox{background-image: url("./Background.png"), url("./NavbarBackground.png")}  /*  Custom background -- Also check userContent.css  */

:root{
--tab-border-radius: 3px !important; /*  Tab border radius -- Changes the tabs rounding  *//*  Default: 3px  */
--NavbarWidth: 43; /*  Default values: 36 - 43  */
--TabsHeight: 36; /*  Minimum: 30  *//*  Default: 36  */
--TabsBorder: 8; /*  Doesnt do anything on small layout  *//*  Default: 8  */
--NavbarHeightSmall: calc(var(--TabsHeight) + var(--TabsBorder))  /*  Only on small layout  *//*  Default: calc(var(--TabsHeight) + var(--TabsBorder))  *//*  Default as a number: 44  */}

@media screen and (min-width:1325px)    /*  Only the tabs space will grow from here  */
{:root #nav-bar{margin-top: calc(var(--TabsHeight) * -1px - var(--TabsBorder) * 1px)!important; height: calc(var(--TabsHeight) * 1px + var(--TabsBorder) * 1px)} #TabsToolbar{margin-left: calc(1325px / 100 * var(--NavbarWidth)) !important} #nav-bar{margin-right: calc(100vw - calc(1325px / 100 * var(--NavbarWidth))) !important; vertical-align: center !important} #urlbar-container{min-width: 0px !important;  flex: auto !important} toolbarspring{display: none !important}}

@media screen and (min-width:850px) and (max-width:1324px)    /*  Both the tabs space and the navbar will grow  */
{:root #nav-bar{margin-top: calc(var(--TabsHeight) * -1px - var(--TabsBorder) * 1px) !important; height: calc(var(--TabsHeight) * 1px + var(--TabsBorder) * 1px)} #TabsToolbar{margin-left: calc(var(--NavbarWidth) * 1vw) !important} #nav-bar{margin-right: calc(100vw - calc(var(--NavbarWidth) * 1vw)) !important; vertical-align: center !important} #urlbar-container{min-width: 0px !important;  flex: auto !important} toolbarspring{display: none !important} #TabsToolbar, #nav-bar{transition: margin-top .25s !important}}

@media screen and (max-width:849px)    /*  The window is not enough wide for a one line layout  */
{:root #nav-bar{padding: 0 5px 0 5px!important; height: calc(var(--NavbarHeightSmall) * 1px) !important} toolbarspring{display: none !important;} #TabsToolbar, #nav-bar{transition: margin-top .25s !important}}
#nav-bar, #PersonalToolbar{background-color: #0000 !important;background-image: none !important; box-shadow: none !important} #nav-bar{margin-left: 3px;} .tab-background, .tab-stack { min-height: calc(var(--TabsHeight) * 1px) !important}

/*  Removes rounding from the top corners,   */
#navigator-toolbox{appearance: none !important; border-radius: 0 !important}
#navigator-toolbox-background{background-color: Field !important; background-image: none !important;  appearance: none !important; border-radius: 0 !important}

#navigator-toolbox-background:-moz-window-inactive{filter: contrast(90%);}  /*  Fades window while not in focus */
:root{--tabpanel-background-color: var(--toolbar-field-background-color) !important}  /*  Removes flash before loading pages  */

/*  Removes annoying buttons and spaces */
#firefox-view-button, #save-to-pocket-button, #tracking-protection-icon-container, .titlebar-spacer[type="pre-tabs"], .titlebar-spacer[type="post-tabs"]{display: none !important}
#tabbrowser-tabs{border-inline-start-width: 0!important}

/*  Makes some buttons nicer  */
#PanelUI-menu-button, #unified-extensions-button, #reload-button, #stop-button {padding: 2px !important}
#reload-button, #stop-button{margin: 1px !important;}

/* Newtab hack */
#tabs-newtab-button, #new-tab-button{transition: .3s !important;color: transparent !important; fill: FieldText !important; background: none !important; opacity: 20%; padding-right: 20px  !important; padding-left: 4px !important; -moz-window-dragging: var(--WindowDraggingFromNewtabButton)}
#tabs-newtab-button:hover, #new-tab-button:hover{transition: .3s !important; color: transparent !important; fill: FieldText !important; opacity: 90%; padding-right: 20px !important;  background: none !important; padding-left: 4px !important; -moz-window-dragging: var(--WindowDraggingFromNewtabButton)}
#tabs-newtab-button > .toolbarbutton-icon , #new-tab-button > .toolbarbutton-icon{ background: none !important;}

/*  Removes urlbar border/background  */
#urlbar-background{border: none !important; outline: none !important; transition: .15s !important;}

/*  Cool animation on tab/bookmark icons  */
.tabbrowser-tab:not([pinned]):not([selected]) .tab-icon-image ,.bookmark-item .toolbarbutton-icon{opacity: 0!important; transition: .15s !important; width: 0!important; padding-left: 16px!important}
.tabbrowser-tab:not([pinned]):hover .tab-icon-image,.bookmark-item:hover .toolbarbutton-icon{opacity: 100!important; transition: .15s !important; display: inline-block!important; width: 16px!important; padding-left: 0!important}
.tabbrowser-tab:not([hover]) .tab-icon-image,.bookmark-item:not([hover]) .toolbarbutton-icon{padding-left: 0!important}

/*  Removes space after pinned tabs  */
#tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])>#tabbrowser-arrowscrollbox>.tabbrowser-tab[first-visible-unpinned-tab] {margin-inline-start: 0!important}

/*  X-button on the tabs  */
.tabbrowser-tab:not(:hover) .tab-close-button{opacity: 0% !important; transition: .3s !important; display: -moz-box !important;}
.tab-close-button[selected]:not(:hover){opacity: 45% !important; transition: .3s !important; display: -moz-box !important;}
.tabbrowser-tab:hover .tab-close-button{opacity: 50%; transition: .3s !important; background: none !important; cursor: pointer; display: -moz-box !important;}
.tab-close-button:hover{opacity: 100% !important; transition: .3s !important; background: none !important; cursor: pointer; display: -moz-box !important;}
.tab-close-button[selected]:hover{opacity: 100% !important; transition: .3s !important; background: none !important; cursor: pointer; display: -moz-box !important;}

/*  Removes annoying border  */
#navigator-toolbox{border:none !important;}

.titlebar-buttonbox-container{-moz-box-ordinal-group: auto;}
.titlebar-button > .toolbarbutton-icon:-moz-lwtheme{-moz-context-properties: fill, stroke !important;}
.titlebar-button > .toolbarbutton-icon {display: flex !important; height:unset !important; width: unset !important;}
.titlebar-buttonbox{appearance: none !important}


#TabsToolbar-customization-target {counter-reset: tabCount}.tabbrowser-tab {counter-increment: tabCount}
#alltabs-button>.toolbarbutton-badge-stack>.toolbarbutton-icon {fill: var(--toolbarbutton-icon-fill) !important; -moz-context-properties: fill !important; list-style-image: url("data:image/svg+xml,%3Csvg width='40' height='30' version='1.1' viewBox='0 0 40 30' xmlns='http://www.w3.org/2000/svg'%3E%3Ctitle%3EVetro%3C/title%3E%3Cpath transform='translate(49,-60)' d='m-29 78.888-7.0703-7.0703 0.70703-0.70703 6.3633 6.3633 6.3633-6.3633 0.70703 0.70703-6.3633 6.3633z' fill='context-fill' style='paint-order:stroke fill markers'/%3E%3C/svg%3E"); overflow: hidden!important; padding: 0!important; border: 0!important; width: 40px!important; height: calc(100% + 1px)!important; margin: 0 -2px 0 0!important; transform: translate(20%,15%); padding: 0 3px}
#alltabs-button>.toolbarbutton-badge-stack {position: relative!important; border-radius: 0!important; padding: 0!important; border: 0!important; height: calc(100% + 1px)!important; width: 56px!important; margin: 0-2px 0 0!important}
#alltabs-button>.toolbarbutton-badge-stack::before {content: counter(tabCount); color: var(--toolbarbutton-icon-fill) !important; position: absolute; bottom: 25%; left: 50%; transform: translate(-50%,-30%); padding: 0 3px}

#urlbar:not(:hover):not([breakout][breakout-extend])>#urlbar-background {box-shadow: none!important; background: #0000 !important}

.urlbarView-row{display: none !important}
.urlbarView-row:nth-child(1), .urlbarView-row:nth-child(2){display: flex !important}
#urlbar-anon-search-settings{margin-inline-start: 0px !important}

#urlbar-container{margin-left: 1px !important}

#sidebar-splitter{display: none}
#sidebar-header{padding-bottom: 0!important; border-bottom: 0!important}

#statuspanel-label{background-color: var(--toolbar-field-background-color)!important; border-color: transparent!important; border-radius: 5px !important; color: currentColor!important; margin: 0 0 2.5px 2px!important; padding: 5px!important; opacity: 100%;}

#appMenu-fxa-separator{border-image:none !important;}

#nav-bar{direction: rtl;} #urlbar-container, #customizationui-widget-panel{direction: ltr !important;}
#forward-button{order: -1 !important;}
#back-button{padding-right: 2px !important;} #forward-button{padding-right: 8px !important;}

#main-window:has(#navigator-toolbox[style=""]) #tabbrowser-tabpanels, :not([sizemode="fullscreen"]) #tabbrowser-tabpanels{margin: -10px 0 0 0!important; border-top-left-radius: 10px !important; border-top-right-radius: 10px !important;}
#main-window:has(#navigator-toolbox[style=""]) .browserStack>browser, :not([sizemode="fullscreen"]) .browserStack>browser{border-top-left-radius: 10px !important; border-top-right-radius: 10px !important;}
#navigator-toolbox{padding-bottom: 10px;}
[inFullscreen] #tabbrowser-tabpanels, [inFullscreen] .browserStack>browser{border-radius: 0 !important; margin: 0 !important; transition: border-radius .7s !important}
.browserStack{background-color: transparent !important; border-radius: 10px !important; z-index: 2;}
.browserContainer{background-color: transparent}
.browserContainer:has(> .devtools-toolbox-bottom-iframe) .browserStack>browser{margin-bottom: -10px !important; border-bottom-right-radius: 10px !important; border-bottom-left-radius: 10px !important; transition: border-radius .2s !important}
findbar{height: 50px; border: none !important; background-color: -moz-Dialog !important; z-index: 1;}
.browserContainer:has(> .devtools-toolbox-bottom-iframe) findbar{border-bottom-right-radius: 10px; border-bottom-left-radius: 10px;}
.findbar-container, findbar .close-icon{margin-top: 10px !important}
.browserContainer:has(> findbar)  .browserStack>browser{margin-bottom: -10px !important; border-bottom-right-radius: 10px !important; border-bottom-left-radius: 10px !important; transition: border-radius .2s !important}
.browserContainer:has(> .devtools-toolbox-bottom-iframe):has(> findbar) findbar{margin-bottom: -10px !important;}
[inFullscreen] .browserContainer:has(> .devtools-toolbox-bottom-iframe) .browserStack>browser{margin-bottom: -10px !important; border-bottom-right-radius: 10px !important; border-bottom-left-radius: 10px !important; transition: border-radius .2s !important}
[inFullscreen] .browserContainer:has(> findbar)  .browserStack>browser{margin-bottom: -10px !important; border-bottom-right-radius: 10px !important; border-bottom-left-radius: 10px !important; transition: border-radius .2s !important}
#main-window{background-color: -moz-Dialog}

.devtools-horizontal-splitter{margin-top: 7px !important;margin-bottom:-12px !important;opacity: 0;}
.devtools-side-splitter{opacity: 0;}
.devtools-toolbox-side-iframe{margin-top: -10px; border-radius: 10px;}

#customization-panelWrapper {max-width: 30em!important}  /*  Fixes the customization page  */
#customization-container > *{margin-top: -10px; background-color: var(--toolbar-field-background-color) !important}  /*  Customizes the customization page  */

#urlbar:not([open]){color: currentColor!important} #urlbar[open]{color: var(--toolbar-field-focus-color)}  /*  Fixes the urlbar color on some themes  */

#sidebar-box{margin-top: -10px !important; border-radius: 0 10px 0 0!important; z-index: 1}
#sidebar-box[positionend="true"]{border-radius: 10px 0 0 0!important}
#sidebar-box > *{background-image:none;}

[position="bottomright topright"]{--panel-border-radius: 0 5px 5px 5px!important}
[position="bottomleft topleft"]{--panel-border-radius: 5px 0 5px 5px!important}
[part="content"]{border: none !important;}
.toolbarbutton-1[open]{--toolbarbutton-border-radius: 4px 4px 0 0!important;}

[class*="identity-color"] > * > * .tab-context-line{border-radius: 0 0 5px 5px !important}  /*  Identity-color  */


[privatebrowsingmode="temporary"] #PanelUI-menu-button > .toolbarbutton-badge-stack{
fill: currentColor !important; -moz-context-properties: fill !important; list-style-image: url("data:image/svg+xml,%3Csvg version='1.1' viewBox='0 0 20 20' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='m4.4607598 4.7745347c-1.6558046-0.022972-3.308558 0.6945846-4.38033889 2.1016252-0.24667376 0.9746947 0.1329625 4.5740951 0.34896868 5.1407791 0.43334585 2.286732 2.30300841 4.007931 4.54440651 4.007931 1.1186988 0 2.1336268-0.446805 2.9349832-1.161493l0.4869937-0.419283a2.4174054 2.4174054 0 0 1 3.138115-0.02344l0.734397 0.606788v-0.0026c0.772021 0.621352 1.717989 1.002634 2.752686 1.002634 2.240064 0 4.109726-1.721199 4.544406-4.007931 0.214673-0.569353 0.608977-4.1526899 0.348969-5.1433851-1.905389-2.5014054-5.647401-2.8223737-7.976801-0.682312l-1.302122 1.1979524h-1.2760796l-1.302122-1.1979524c-1.0196962-0.936277-2.3086136-1.4014458-3.5964616-1.4193132zm1.0390935 3.6954225c0.9293602 0 1.7557821 0.389533 2.2891309 0.992217a0.86669252 0.86669252 0 0 1 0 1.1302418c-0.5333488 0.602685-1.3597707 0.989614-2.2891309 0.989614-0.9293601 0-1.7557821-0.386929-2.2891308-0.989614a0.86669252 0.86669252 0 0 1 0-1.1302418c0.5333487-0.602684 1.3597707-0.992217 2.2891308-0.992217zm9.0002687 0c0.929359 0 1.755781 0.389533 2.289131 0.992217a0.86669252 0.86669252 0 0 1 0 1.1302418c-0.53335 0.602685-1.359772 0.989614-2.289131 0.989614-0.92936 0-1.755782-0.386929-2.289131-0.989614a0.86669252 0.86669252 0 0 1 0-1.1302418c0.533349-0.602684 1.359771-0.992217 2.289131-0.992217z' fill='context-fill' stroke-width='1.33337'/%3E%3C/svg%3E%0A");}
#private-browsing-indicator-with-label{display: none}

#tab-notification-deck .container.infobar{background: -moz-Dialog !important}
#tab-notification-deck .notificationbox-stack{background: transparent !important}

#wrapper-urlbar-container{width: 100px !important}
[title="Flexible Space"]{display: none !important}

#fullscreen-warning{border: none !important; background: -moz-Dialog !important}

      '';

      userContent = ''

@-moz-document url("about:newtab"), url("about:home"){.outer-wrapper.ds-outer-wrapper-breakpoint-override.only-search.visible-logo{background-image: url("./Background.png"), url("./NewtabBackground.png"); background-position: 0 -44px, 0 0 !important;}}/*  Custom background -- Also check userChrome.css  */

@-moz-document url-prefix(about:){
:root{--newtab-background-color: -moz-Dialog !important;
--in-content-background-color: -moz-Dialog !important;
--in-content-page-background: -moz-Dialog !important;
--in-content-table-background: -moz-Dialog !important;
--in-content-box-background-odd: -moz-Dialog !important;
--card-background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;
--in-content-box-background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;
--in-content-button-background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;
--in-content-box-background: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;
--in-content-box-info-background: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;
--message-bar-text-color: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;
--newtab-background-color-secondary: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;
--in-content-button-background-hover: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;
--box-background: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;
--button-background-color: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;
--button-hover-background-color: color-mix(in srgb, currentColor 15%, -moz-Dialog) !important;}
body{background-color: -moz-Dialog !important} @-moz-document url(about:blank){body{background-color: #eee !important} @media (prefers-color-scheme: dark){body{background-color: #222 !important}}}

body,html{overflow-y: auto}

@-moz-document url("about:home"), url("about:newtab"){
.search-wrapper .search-handoff-button .fake-caret {top: 13px !important; inset-inline-start: 48px !important}
.search-wrapper .logo-and-wordmark{opacity: 0.9 !important; order: 1 !important; margin-bottom: 0 !important; flex: 1 !important; flex-basis: 20% !important}
.search-wrapper .search-handoff-button .fake-caret{top: 13px !important; inset-inline-start: 48px !important}
.search-wrapper .logo-and-wordmark{opacity: 0.9 !important; order: 1 !important; margin-bottom: 0 !important; flex: 1 !important; flex-basis: 20% !important}
.outer-wrapper .search-wrapper{padding: 0px !important; display: flex !important; flex-direction: row !important; flex-wrap: wrap !important; justify-content: center !important; align-items: center !important; align-content: space-around !important; gap: 20px 10px !important}
.search-wrapper .logo-and-wordmark .logo{background-size: 60px !important; height: 60px !important; width: 60px !important}
.search-wrapper .search-inner-wrapper{min-height: 42px !important; order: 2 !important; flex: 3 !important; flex-basis: 60% !important; top: 4px !important}
.search-wrapper .search-inner-wrapper{min-height: 42px !important; order: 2 !important; flex: 3 !important; flex-basis: 60% !important; top: 4px !important}
.outer-wrapper.ds-outer-wrapper-breakpoint-override.only-search.visible-logo{display: flex !important; padding-top: 0px !important;vertical-align: middle; }
.customize-menu{border-radius: 10px 0 0 10px !important}
#root > div{align-items: center; display: flex}}}

@-moz-document url("about:privatebrowsing"){
#search-handoff-button{border-radius: 10px !important; background-color: color-mix(in srgb, FieldText 13%, -moz-Dialog) !important; border: none !important; box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15) !important;}
.fake-textbox{color: FieldText !important;}
.search-inner-wrapper{min-width: 0 !important; flex-grow: 2 !important; max-width: 720px; height: 42px !important;}
.showPrivate.showSearch.container{padding: 0px !important; display: flex !important; flex-direction: row !important; flex-wrap: wrap !important; justify-content: center !important; align-items: center !important; align-content: space-around !important}
.logo-and-wordmark .logo{background-size: 60px !important; height: 60px !important; width: 60px !important}
.logo-and-wordmark{max-width: fit-content !important; max-height: 82px !important; opacity: 0.9 !important; margin-bottom: 0 !important; flex: 1 !important; flex-basis: 20% !important}
.showPrivate.showSearch.container{display: flex !important; padding-top: 0px !important;vertical-align: middle; flex-direction: row; align-items: center; max-width: unset !important; width: -moz-available !important; gap: 20px 0px !important}
.customize-menu{border-radius: 10px 0 0 10px !important}
#root > div{align-items: center; display: flex}
.info{display: none}
.wordmark{background-size: 134px !important; margin-inline-start: 0 !important; fill: FieldText !important;}
}


@-moz-document url-prefix(about:devtools), url-prefix(chrome:){
.devtools-tab-line{border-radius: 0 0 5px 5px !important; height: 2px !important}
#toolbox-container{margin-top: 10px !important; background: -moz-Dialog !important}  /*  Makes rounded corners with userchrome look better  */
.devtools-tabbar{background: -moz-Dialog !important; border: none !important}
#toolbox-container .customize-animate-enter-done, #toolbox-container .customize-menu, #toolbox-container .top-site-outer:hover, #toolbox-container button{background-color: -moz-Dialog!important}
.devtools-toolbar{height: 35px !important; border: none !important; background-color: -moz-Dialog !important}  /*  Has effect on all toolbars  */
.toolbox-panel-iframe{border-radius: 8px 8px 0 0 !important}
#toolbox-toolbar-mount{ background: -moz-Dialog !important;}
.toolbox-panel.theme-toolbar{ background: -moz-Dialog !important;}
.chrome-debug-toolbar{ margin: -5px 5px 5px 5px !important; border: none !important; border-radius: 10px !important; background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; padding-right: 5px !important; }
.chrome-debug-toolbar__modes > label{ border: none !important;  background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; }
.chrome-debug-toolbar__modes input, .chrome-debug-toolbar__modes .mode__sublabel{display: none !important}
.chrome-debug-toolbar__modes .selected{background: color-mix(in srgb, currentColor 3%, -moz-Dialog) !important}


.tooltip-panel{ border-radius: 10px !important; border: none; background: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important; }
.tooltip-arrow{display: none !important}
.command{  border-radius: 8px !important; margin: 0 10px; width: 90%;}}

@-moz-document url-prefix(chrome:){

#toolbox-notificationbox  .notification{ background: color-mix(in srgb, #000 20%, -moz-Dialog) !important; border: none !important; padding: 3px !important; }

.accordion input:not([type="checkbox"]) {border: none !important}
#browser-style-checkbox:not(:checked):hover, #devtools-cache-checkbox:not(:checked):hover, #record-allocation-stacks-checkbox:not(:checked):hover, .accordion input[type="checkbox"]:not(:checked):hover, #devtools-display-tabbing-order-checkbox:not(:checked):hover{appearance: Dialog !important; border: 2px solid currentColor !important; border-radius: 2px !important;background-color: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important}
#browser-style-checkbox:not(:checked), #devtools-cache-checkbox:not(:checked), #record-allocation-stacks-checkbox:not(:checked), .accordion input[type="checkbox"]:not(:checked), #devtools-display-tabbing-order-checkbox:not(:checked){appearance: Dialog !important; border: 2px solid currentColor !important; border-radius: 2px !important}

:root{scrollbar-color: color-mix(in srgb, FieldText 35%, -moz-Dialog) transparent !important;}  /*  Removes scrollbar backround  */

#markup-box{background-color: -moz-Dialog !important}
#markup-box iframe{border-radius: 15px !important;background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; margin-left: 10px !important; width: 98.65% !important}
.tag-state{border-radius: 6px !important; width: auto !important; left: -16px !important; right: 10px !important;}
.tag-hover{background: color-mix(in srgb, #000 20%, -moz-Dialog) !important; z-index: 0 !important; opacity: 30%}
html body.theme-body.devtools-monospace div#root-wrapper div#root{ padding: 6px 0 6px 10px !important; }
#inspector-breadcrumbs{top: auto; !important}
#inspector-breadcrumbs-toolbar{height: 24px !important;}
#inspector-eyedropper-toggle{margin-right: 2px !important;}
.theme-body{background: transparent !important}
#ruleview-toolbar{ flex-wrap: nowrap !important; }
#sidebar-panel-changes{ border-radius: 10px !important; background: color-mix(in srgb, #000 20%, -moz-Dialog) !important; }
.computed-property-view{ background: transparent !important;}
.computed-property-view.row-striped{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}
#computed-property-container{background-color: color-mix(in srgb, #000 20%, -moz-Dialog) !important}
#computed-container-focusable, #sidebar-panel-computedview{background: -moz-Dialog !important}
#computed-container{border-radius: 10px !important;}

.webconsole-filteringbar-wrapper.wide{margin-bottom: 8px !important;}
.tabs-menu-item{background-color: transparent !important}
.message{margin: 0 1px 2px 1px !important; border-radius: 10px !important; padding: 5px !important; border-bottom: -6px !important; width: 98% !important; left: 50%; transform: translate(-50%, 0);}
.jsterm-input-container{border-radius: 8px 8px 0 0 !important; border: none !important}
.webconsole-app{background-color: -moz-Dialog !important}
#mount .sidebar-item{border-radius: 10px !important; padding: 10px 0 10px 5px !important; margin-bottom: 4px !important;}
#mount .js-sidebar{padding: 0 5px 0px 7px !important; background: -moz-Dialog !important; border: none !important}
#mount > main{background: -moz-Dialog;}
#mount .app-page{border-radius: 10px !important; background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}
html#devtools-webconsole body.theme-sidebar main#app-wrapper.theme-body div.webconsole-app.jsterm-editor.eager-evaluation div.flexible-output-input div.jsterm-input-container.devtools-input{ margin-top: 8px !important; }

.devtools-filterinput{ background-color: -moz-Dialog !important; vertical-align: center !important; border-radius: 8px !important; }
.sources-panel .devtools-filterinput{background: color-mix(in srgb, currentColor 5%, -moz-Dialog)  !important;}
#font-preview-input-container { border: none !important; background: -moz-Dialog !important;  border-radius: 8px !important;  height: auto !important; }
#font-preview-input-container .devtools-searchinput{ background: none !important; }
.font-value-input{ border-radius: 10px !important; border: none !important; padding: 3px 10px 3px 3px !important; }
#font-preview-input-container .devtools-searchinput{ height: 31px !important; border-radius: 10px !important; margin: -8px 0 -8px 0; }
.input-expression, .xhr-input-url, .event-search-input{background:  color-mix(in srgb, currentColor 3%, -moz-Dialog) !important; appearance: none !important;  margin: 5px 2px 5px 8px !important; border-radius: 8px !important; width: 97% !important;}
.exclude-patterns-field.small input{ border-radius: 8px !important; border: none !important; padding: 18px 5px 18px 10px !important; background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; appearance: inherit !important; }
.devtools-searchbox{height: auto !important; border-radius: 8px !important;}

#font-editor{ background: -moz-Dialog !important; }
#font-container > .accordion{border: none !important}
.font-value-select{ background: auto !important; padding: 4px !important; border-radius: 3px !important; border: none !important; text-align: center; background-image: none !important }
#font-container{ background: -moz-Dialog !important; }

.source-outline-panel .tree-node{border-radius: 8px !important; padding: 5px !important; width: 96% !important; margin: 0 0 2px 2px}
.perf-onboarding{display: none !important}
.source-outline-tabs .tab::before, .source-tab::before{border-radius: 0 0 2px 2px !important; background-image: none !important}
.source-outline-tabs .tab:not(.active){background: color-mix(in srgb, currentColor 5%, -moz-Dialog)  !important; width: 90%; color: inherit !important}
.source-tab:hover{background: transparent !important;}
.source-tab:not(.active) > .img{display: none !important}
.exclude-patterns-field.small{background: -moz-Dialog !important; border: none !important}
.exclude-patterns-field.small > *{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}
.project-text-search{margin-top: 9px !important;}
.project-text-search .search-outline{ width: 94%; margin-left: 8px; border: none !important; }
.project-text-search .search-outline .search-field.small{ background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; padding: 5px; border-radius: 8px; border: none !important; margin-bottom: 5px !important; margin-top: 1px !important; }
.exclude-patterns-field.small > label{display: contents;}
.search-modifiers{background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}
.source-outline-tabs{width: 98% !important}
.source-outline-tabs > .tab{background-color:  color-mix(in srgb, currentColor 3%, -moz-Dialog) !important;}
.source-outline-tabs > .tab:first-child{border-radius: 8px 0 0 8px !important}
.source-outline-tabs > .tab:last-child{border-radius: 0 8px 8px 0 !important}
.tab.sources-tab.active{background-color:  color-mix(in srgb, currentColor 3%, -moz-Dialog) !important;}
.source-footer, .source-header{background: -moz-Dialog !important; border: none !important}
.editor-wrapper > *{background: -moz-Dialog !important; border: none !important}
.editor-wrapper > * > *, .welcomebox{border-radius: 8px !important;background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; z-index: 2 !important;}
.outline-footer{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; border-radius: 8px !important; border: none !important;}
.outline-footer > button {width: -moz-available !important; border-radius: 8px !important; }
.outline-footer > button:hover {width: -moz-available !important; border-radius: 8px !important; background: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important;}
.secondary-panes-wrapper > *{background: -moz-Dialog !important;}
.command-bar{border: none !important;}
.source-outline-panel{margin-top: -8px !important;padding: 8px !important;}

.snapshot-list-item{ border-radius: 10px !important; border: none !important; margin-bottom: 5px !important; }
.snapshot-list-item:not(.selected){background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}
#shortest-paths > div{border-radius: 10px !important; background: -moz-Dialog !important;}
#shortest-paths{background: -moz-Dialog !important;}
#heap-view .h-split-box{border-radius: 10px !important;}
.heap-view-panel > .tree{ border-radius: 10px 10px 0 0!important; }
.heap-view-panel > .header{background: -moz-Dialog !important; border: none !important}
.heap-view-panel{background: -moz-Dialog !important}
#memory-tool-container > ul{ padding: 5px !important; padding-top: 5px; background: -moz-Dialog !important; border: none !important; padding-top: 2px !important; }
.tree-map-container{ border-radius: 10px !important; }
.toolbar-group, #record-allocation-stacks-label{border-inline-end: none !important;}
#record-allocation-stacks-label{margin-inline-end: 10px !important;}

.devtools-invisible-splitter, .splitview-nav{background-color: -moz-Dialog !important}
.splitview-controller{padding: 0 15px 0 5px !important; background-color: -moz-Dialog !important;}
.theme-body.devtools-monospace .CodeMirror-gutters{background: color-mix(in srgb, #000 20%, -moz-Dialog) !important}
.theme-body.devtools-monospace .CodeMirror-scroll{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}

.outline-filter{border: none !important;}
.tabs, .sources-panel{background-color: -moz-Dialog !important}
.tabs-navigation, .source-outline-tabs{background-color: color-mix(in srgb, currentColor 3%, -moz-Dialog) !important; border: none !important; padding: 0 10px 0 5px; border-radius: 10px !important; margin: 3px !important}
.all-tabs-menu{right: 10px !important; background-color: transparent !important; border: none !important;}
.panels{background-color: -moz-Dialog !important}
pre{margin-right: 20px;}

.request-list-container{background: -moz-Dialog !important;}
.request-list-empty-notice, .requests-list-scroll{border-radius: 10px !important; background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important}

#mount .sidebar-item{border-radius: 10px !important; padding: 10px 0 10px 5px !important; margin-bottom: 4px !important;}
#mount .js-sidebar{padding: 0 5px 0px 7px !important; background: -moz-Dialog !important; border: none !important}
#mount > main{background: -moz-Dialog;}
#mount .app-page{border-radius: 10px !important; background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}

#storage-table{background: -moz-Dialog !important;}
#storage-tree{background: -moz-Dialog !important;border-radius: 10px !important; padding-top: 3px !important}

.horz{background-color: -moz-Dialog !important}
.horz .splitter{flex: 0 0 10px !important; margin: auto 2px auto 2px !important; height: 80%; justify-content: center; opacity: 100%; border-radius: 4px !important;}
.horz #ruleview-container{  margin-top: 15px;}

.theme-light .tree-widget-item.theme-selected{color: #000 !important;}
.devtools-toolbar-select{ background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; border-radius: 4px !important; border: none !important; padding: 4px !important; appearance: dialog !important; }
#toolbox-deck{border-radius: 10px !important;}
.theme-dark{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important}
 body{background-color: color-mix(in srgb, currentColor 7%, -moz-Dialog) !important}
#ruleview-container, .layout-container, .devtools-sidebar-tabs .panels{border-radius: 10px !important; background-color: -moz-Dialog; padding: 0 5px 0 5px;}
.splitter{flex: 0 0 10px !important; margin: 30px -9px 30px -6px !important; justify-content: center; opacity: 0;}
.devtools-inspector-tab-panel{background-color: -moz-Dialog !important}
.compatibility-app__container{background-color: -moz-Dialog !important}
.compatibility-footer{border: none !important;}
.devtools-separator{display: none !important;}

window box.devtools-responsive-container.theme-body vbox#storage-tree ul.tree-widget-container li ul.tree-widget-children li div.tree-widget-item{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; border-radius: 8px !important; margin-bottom: 2px !important; padding: 5px !important; width: 85% !important; margin-left: 12px !important;  margin-right: 5px !important}
.tree-widget-item:not(window box.devtools-responsive-container.theme-body vbox#storage-tree ul.tree-widget-container li ul.tree-widget-children li div.tree-widget-item){ border-radius: 8px !important; margin-bottom: 2px !important; padding: 5px !important; width: 90% !important; margin-left: 2px !important; margin-right: 5px !important}
.devtools-side-splitter{opacity: 0% !important}
.devtools-responsive-container.theme-body{background: -moz-Dialog !important;}
.devtools-toolbar{position: sticky; top: 0px}

#style-editor-chrome .devtools-invisible-splitter{border-radius: 10px 0 0 10px !important; background: color-mix(in srgb, #000 20%, -moz-Dialog) !important; !important; width: 10px; margin-left: -10px !important; opacity: 100% !important; margin-bottom: 35px !important}
.editor-pane .CodeMirror-gutters{background: color-mix(in srgb, #000 20%, -moz-Dialog) !important}
.editor-pane .CodeMirror-scroll{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}
.at-rule-label{ border: none !important; padding: 5px !important; background: aliceblue; border-radius: 8px !important; margin: 0 0 3px 5px !important; width: 92% !important; background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; }
window#style-editor-chrome-window box#style-editor-chrome.devtools-responsive-container.theme-body box.splitview-side-details.devtools-main-content box.splitview-details.splitview-active hbox.stylesheet-details-container vbox.stylesheet-sidebar.theme-sidebar toolbar.devtools-toolbar, .stylesheet-at-rules-container{background: color-mix(in srgb, #000 20%, -moz-Dialog) !important}
.splitview-nav{border-radius: 10px !important;}
.splitview-nav > *{border-radius: 8px !important; border: none !important; margin-bottom: 5px !important; padding: 3px !important; background-image: none !important}
.splitview-nav > *:not(:hover, .splitview-active){background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important}
#splitview-resizer-target{background-color: -moz-Dialog !important}
.splitview-main > toolbar, .loading .splitview-nav-container{border-inline-end: none !important} /*  Removes line while loading  */
.splitview-side-details.devtools-main-content{background: color-mix(in srgb, #000 20%, -moz-Dialog) !important;}
window#style-editor-chrome-window box#style-editor-chrome.devtools-responsive-container.theme-body box.splitview-side-details.devtools-main-content box.splitview-details.splitview-active hbox.stylesheet-details-container box.stylesheet-editor-input.textbox iframe{ border-radius: 0 10px 10px 0 !important; }
.stylesheet-editor-input.textbox{margin-bottom: -10px !important;z-index: 1;}
.devtools-toolbar.stylesheet-editor-status{height: 45px !important; padding-top: 10px !important; margin-bottom: -45px;}
.stylesheet-at-rules-container{margin-bottom: -10px !important;z-index: 2;border-radius: 0 0 10px 10px;}
.stylesheet-details-container{background-color: -moz-Dialog !important;}
.stylesheet-sidebar.theme-sidebar .devtools-toolbar{border-radius: 10px 10px 0 0 !important;}
.stylesheet-sidebar.theme-sidebar{background-color: -moz-Dialog !important; margin: 0 5px; margin-bottom: -15px !important;}
.splitview-side-details.devtools-main-content{margin-bottom: -10px !important;z-index: 1;border-radius: 0 10px 10px 0 !important;margin-right: 5px;}
.stylesheet-editor-input.textbox > iframe{margin-bottom: 10px !important;}
.stylesheet-at-rules-container{padding-left: 10px;}
#style-editor-chrome box:has(> .splitview-side-details.devtools-main-content){margin-bottom: 45px !important}

body main#mount.theme-body div.debugger div.A11y-mouse div.split-box.vert div.controlled div.secondary-panes-wrapper div.secondary-panes div ul.accordion *:not([type="checkbox"]) {border: none !important}
body.theme-body.devtools-monospace div#content div.mainFrame span div.split-box.vert div.uncontrolled{border-radius: 10px !important}
body.theme-body.devtools-monospace div#content div.mainFrame span div.split-box.vert{background: -moz-Dialog !important}
body.theme-body.devtools-monospace div#content div.mainFrame span div.split-box.vert div.controlled div.right-sidebar{margin-left: 10px !important;}
body.theme-body.devtools-monospace div#content div.mainFrame span div.split-box.vert div.controlled div.right-sidebar ul.accordion{width: 95% !important; padding-right: 10px !important;}
#sidebar-panel-ruleview, .accordion{background-color: -moz-Dialog !important}
.accordion li h2:not(.accordion-header){background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; margin: 5px 2px 5px 8px !important; border-radius: 8px !important; width: 97% !important}
.ruleview-rule, .accordion-content{border-radius: 8px !important; padding: 5px !important; background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; border-bottom: none !important; margin-bottom: 4px !important;}
.ruleview-header, .accordion-header{background-color: -moz-Dialog !important; border-bottom: none !important}

#sidebar-panel-changes .source .href{background: -moz-Dialog !important; border: none !important}
#sidebar-panel-changes .source{background: -moz-Dialog !important}
#sidebar-panel-changes .changes__toolbar{ padding: 6px !important; border: none !important; background: -moz-Dialog !important; padding: 0 !important; }
#sidebar-panel-changes .changes__rule {background: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; border-radius: 8px !important; margin-bottom: 2px !important}
#sidebar-panel-changes{background: -moz-Dialog !important; border: none !important}

.changes__copy-all-changes-button{width: -moz-available; padding: 6px !important; background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important; border-radius: 10px !important; margin: 6px !important; background-position: 13px 9.5px !important; height: 35px !important;}
.changes__copy-all-changes-button:hover{background-color: color-mix(in srgb, currentColor 13%, -moz-Dialog) !important}

.accessibility-check{background-color: color-mix(in srgb, currentColor 5%, -moz-Dialog) !important;}
.right-sidebar{background: -moz-Dialog !important;}
.checks .list > *{padding: 0 !important}}

      '';

    };

  };

}
