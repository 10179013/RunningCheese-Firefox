
// ˫��ҳ��հ״����ز����
gBrowser.mPanelContainer.addEventListener("dblclick",
     function(aEvent){
       if (aEvent.ctrlKey) return;
       aEvent.stopPropagation();
       SidebarUI.hide();
     }, false);
