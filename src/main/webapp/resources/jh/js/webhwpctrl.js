var HwpCtrl = function(hwpCtrlApp, imageLoader) {
	if (this._HwpCtrl != null && typeof this._HwpCtrl == "function") {
		this._HwpCtrl(hwpCtrlApp, imageLoader);
    } else {
		throw "ERROR : HwpCtrl : new를 사용하여 생성해 주세요.";
    }
    hwpCtrlApp.hwpCtrlIntf = this;
};

HwpCtrl.prototype._HwpCtrl = function (hwpCtrlApp, imageLoader) {
    this.Impl = hwpCtrlApp.hwpCtrlImpl;
};

HwpCtrl.prototype.__HwpCtrl = function () {
};

//Properties
Object.defineProperties(HwpCtrl.prototype, {
        AutoShowHideToolBar:{
            get: function(){
                return this.Impl.AutoShowHideToolBar;
            },
            set: function(bNewValue){
                this.Impl.AutoShowHideToolBar = bNewValue;
            },
            configurable:false
        },
        CellShape:{
            get: function(){
                return this.Impl.CellShape;
            },
            set: function(newValue){
                this.Impl.CellShape = newValue;
            },
            configurable:false
        },
        CharShape:{
            get: function(){
                return this.Impl.CharShape;
            },
            set: function(newValue){
                this.Impl.CharShape = newValue;
            },
            configurable:false
        },
        CurFieldState:{
            get: function(){
                return this.Impl.CurFieldState;
            },
            //SetNotSupported
            configurable:false
        },
        EditMode:{
            get: function(){
                return this.Impl.EditMode;
            },
            set: function(nNewValue){
                this.Impl.EditMode = nNewValue;
            },
            configurable:false
        },
        EngineProperties:{
            get: function(){
                return this.Impl.EngineProperties;
            },
            set: function(newValue){
                this.Impl.EngineProperties = newValue;
            },
            configurable:false
        },
        HeadCtrl:{
            get: function(){
                return this.Impl.HeadCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        IsEmpty:{
            get: function(){
                return this.Impl.IsEmpty;
            },
            //SetNotSupported
            configurable:false
        },
        IsModified:{
            get: function(){
                return this.Impl.IsModified;
            },
            set: function(modified){
                this.Impl.IsModified = modified;
            },
            configurable:false
        },
        IsPreviewMode:{
            get: function(){
                return this.Impl.IsPreviewMode;
            },
            //SetNotSupported
            configurable:false
        },
        LastCtrl:{
            get: function(){
                return this.Impl.LastCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        PageCount:{
            get: function(){
                return this.Impl.PageCount;
            },
            //SetNotSupported
            configurable:false
        },
        ParaShape:{
            get: function(){
                return this.Impl.ParaShape;
            },
            set: function(newValue){
                this.Impl.ParaShape = newValue;
            },
            configurable:false
        },
        ParentCtrl:{
            get: function(){
                return this.Impl.ParentCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        Path:{
            get: function(){
                return this.Impl.Path;
            },
            set: function(lpszNewValue){
                this.Impl.Path = lpszNewValue;
            },
            configurable:false
        },
        SelectionMode:{
            get: function(){
                return this.Impl.SelectionMode;
            },
            //SetNotSupported
            configurable:false
        },
        Version:{
            //TODO: 기존에는 Registry에서 얻어왔음. 보류
            get: function(){
                return this.Impl.Version;
            },
            //SetNotSupported
            configurable:false
        },
        ViewProperties:{
            get: function(){
                return this.Impl.ViewProperties;
            },
            set: function(newValue){
                this.Impl.ViewProperties = newValue;
            },
            configurable:false
        },
        ScrollPosInfo:{
            get: function(){
                return this.Impl.ScrollPosInfo;
            },
            set: function(newValue){
                this.Impl.ScrollPosInfo = newValue;
            },
            configurable:false
        },
        HyperlinkMode:{
            get: function(){
                return this.Impl.HyperlinkMode;
            },
            set: function(state){
                return this.Impl.HyperlinkMode = state;
            },
            configurable:false
        },
        ReadOnlyMode:{
            get: function(){
                return this.Impl.ReadOnlyMode;
            },
            set: function(bNewValue){
                this.Impl.ReadOnlyMode = bNewValue;
            },
            configurable:false
        },
        XHwpDocuments:{
            //TODO: Automation관련 Property는 현재 지원할 수 없음. 향후 다른 방향으로 지원할 수 있을지 검토.
            get: function(){
                alert("HwpDocuments Property는 지원할 수 없습니다.");
            },
            //SetNotSupported
            configurable:false
        },
        CurSelectedCtrl:{
            get: function(){
                return this.Impl.CurSelectedCtrl;
            },
            //SetNotSupported
            configurable:false
        },
        IsPrivateInfoProtected:{
            get: function(){
                return this.Impl.IsPrivateInfoProtected;
            },
            //SetNotSupported
            configurable:false
        },
        AutoScroll:{
            get: function(){
                return this.Impl.AutoScroll;
            },
            set: function(bNewValue){
                this.Impl.AutoScroll = bNewValue;
            },
            configurable:false
        },
        AccessibleMode:{
            get: function(){
                return this.Impl.AccessibleMode;
            },
            set: function(bNewValue){
                this.Impl.AccessibleMode = bNewValue;
            },
            configurable:false
        },
        SubstFontNotifyMode:{
            get: function(){
                return this.Impl.SubstFontNotifyMode;
            },
            set: function(bNewValue){
                this.Impl.SubstFontNotifyMode = bNewValue;
            },
            configurable:false
        }
    }
);

//Method
HwpCtrl.prototype.AddEventListener = function(eventType, listener) {
    try {
        this.Impl.AddEventListener(eventType, listener);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.AboutBox = function() {
    try {
        this.Impl.AboutBox();
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.Clear=function (option) {
    try {
        this.Impl.Clear(option);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.CreateAction= function(aidStr) {
    try {
        return this.Impl.CreateAction(aidStr);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.CreateSet = function(setStr) {
    try {
        return this.Impl.CreateSet(setStr);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.CreateField = function (direction, memo, name) {
    try {
        return this.Impl.CreateField(direction, memo, name);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.ConvertPUAHangulToUnicode = function (reverse) {
    try {
        return this.Impl.ConvertPUAHangulToUnicode(reverse);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.DeleteCtrl = function (ctrl) {
    try {
        return this.Impl.DeleteCtrl(ctrl);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.GetMessageBoxMode = function () {
    try {
        return this.Impl.GetMessageBoxMode();
    } catch (e) {
        console.warn(e);
        return 0;
    }
};

HwpCtrl.prototype.SetMessageBoxMode = function (mode) {
    try {
        return this.Impl.SetMessageBoxMode(mode);
    } catch (e) {
        console.warn(e);
        return 0;
    }
};

HwpCtrl.prototype.ExportStyle = function (styleset) {
    try {
        return this.Impl.ExportStyle(styleset);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.ImportStyle = function (styleset) {
    try {
        return this.Impl.ImportStyle(styleset);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.IsSpellCheckCompleted = function () {
    try {
        return this.Impl.IsSpellCheckCompleted();
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.FieldExist = function (field) {
    try {
        return this.Impl.FieldExist(field);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.GetMemoString = function (ctrl) {
    try {
        return this.Impl.GetMemoString(ctrl);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetHeadingString = function () {
    try {
        return this.Impl.GetHeadingString();
    } catch (e) {
        console.warn(e);
        return "";
    }
};

HwpCtrl.prototype.GetContextMenu = function (contextID) {
    try {
        return this.Impl.GetContextMenu(contextID);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetCtrlHorizontalOffset = function (ctrl, relTo) {
    try {
        return this.Impl.GetCtrlHorizontalOffset(ctrl, relTo);
    } catch (e) {
        console.warn(e);
        return 0;
    }
};

HwpCtrl.prototype.GetCtrlVerticalOffset = function (ctrl, relTo) {
    try {
        return this.Impl.GetCtrlVerticalOffset(ctrl, relTo);
    } catch (e) {
        console.warn(e);
        return 0;
    }
};

HwpCtrl.prototype.GetFilterList = function (flags) {
    try {
        return this.Impl.GetFilterList(flags);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.KeyIndicator = function () {
    try {
        return this.Impl.KeyIndicator();
    } catch (e) {
        console.warn(e);
        var resultObject = {};
        resultObject["result"] = false;
        resultObject["seccnt"] = 0;
        resultObject["secno"] = 0;
        resultObject["prnpageno"] = 0;
        resultObject["colno"] = 0;
        resultObject["line"] = 0;
        resultObject["pos"] = 0;
        resultObject["over"] = 0;
        resultObject["ctrlname"] = "";

        return resultObject;
    }
};

HwpCtrl.prototype.GetFormObjectAttr = function (formname, attrname) {
    try {
        return this.Impl.GetFormObjectAttr(formname, attrname);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.SetFormObjectAttr = function (formname, attrname, value) {
    try {
        return this.Impl.SetFormObjectAttr(formname, attrname ,value);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetMessageSet = function () {
    try {
        return this.Impl.GetMessageSet();
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetMousePos = function (Xrelto, Yrelto) {
    try {
        return this.Impl.GetMousePos(Xrelto, Yrelto);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.PreviewCommand = function (previewmode) {
    try {
        return this.Impl.PreviewCommand(previewmode);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.GetTableCellAddr = function (type) {
    try {
        return this.Impl.GetTableCellAddr(type);
    } catch (e) {
        console.warn(e);
        return -1;
    }
};

HwpCtrl.prototype.GetViewStatus = function (nType) {
    try {
        return this.Impl.GetViewStatus(nType);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetCurFieldName = function (option) {
    try {
        return this.Impl.GetCurFieldName(option);
    } catch (e) {
        console.warn(e);
        return "";
    }
};

HwpCtrl.prototype.GetFieldList = function (number, option) {
    try {
        return this.Impl.GetFieldList(number, option);
    } catch (e) {
        console.warn(e);
        return "";
    }
};

HwpCtrl.prototype.GetFieldText = function (fieldlist) {
    try {
        return this.Impl.GetFieldText(fieldlist);
    } catch (e) {
        console.warn(e);
        return "";
    }
};

HwpCtrl.prototype.GetText = function(){
    try {
        return this.Impl.GetText();
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetTextBySet = function(text){
    try {
        return this.Impl.GetTextBySet(text);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetTextFile = function (format, option, callback) {
    try {
        return this.Impl.GetTextFile(format, option, callback);
    } catch (e) {
        console.warn(e);
        return "";
    }
};

HwpCtrl.prototype.GetFileInfo = function (FileName) {
    try {
        return this.Impl.GetFileInfo(FileName);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetPosBySet = function () {
    try {
        return this.Impl.GetPosBySet();
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetPos = function () {
    try {
        return this.Impl.GetPos();
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetMousePos = function(Xrelto, Yrelto) {
    try {
        return this.Impl.GetMousePos(Xrelto, Yrelto);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetSelectedPosBySet = function(sset, eset) {
    try {
        return this.Impl.GetSelectedPosBySet(sset, eset);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetSelectedPos = function() {
    try {
        return this.Impl.GetSelectedPos();
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.InsertMenu = function(menuidx, menustr, actionstr, menutype) {
    try {
        return this.Impl.InsertMenu(menuidx, menustr, actionstr, menutype);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.RemoveMenu = function(menuidx, menutype) {
    try {
        return this.Impl.RemoveMenu(menuidx, menutype);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.GetPageText = function(pgno, option) {
    try {
        return this.Impl.GetPageText(pgno, option);
    } catch (e) {
        console.warn(e);
        return "";
    }
};

HwpCtrl.prototype.ShowCaret = function(bShow) {
    try {
        return this.Impl.ShowCaret(bShow);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.SetBarCodeImage = function(lpImagePath, pgno, index, x, y, width, height) {
    try {
        return this.Impl.SetBarCodeImage(lpImagePath, pgno, index, x, y, width, height);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.ShowPageTooltip = function(bShow) {
    try {
        return this.Impl.ShowPageTooltip(bShow);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.ShowToolBar = function(bShow) {
    try {
        return this.Impl.ShowToolBar(bShow);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.ShowRibbon = function(bShow) {
    try {
        return this.Impl.ShowRibbon(bShow);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.FoldRibbon = function(bFold) {
    try {
        return this.Impl.FoldRibbon(bFold);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SetToolBar = function(option, toolbarID) {
    try {
        return this.Impl.SetToolBar(option, toolbarID);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.ShowStatusBar = function(bShow) {
    try {
        return this.Impl.ShowStatusBar(bShow);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.IsCommandLock = function (actionID) {
    try {
        return this.Impl.IsCommandLock(actionID);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.InitScan = function (option, range, spara, spos, epara, epos) {
    try {
        return this.Impl.InitScan(option, range, spara, spos, epara, epos);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.Insert = function (path, format, arg, callback, callbackUserData) {
    try {
        return this.Impl.Insert(path, format, arg, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.InsertPicture = function (path, embedded, sizeoption, reverse, watermark, effect, width, height, callback) {
    try {
        return this.Impl.InsertPicture(path, embedded, sizeoption, reverse, watermark, effect, width, height, callback);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.InsertBackgroundPicture = function (bordertype, path, embedded, filloption, watermark, effect, brightness, contrast, callback) {
    try {
        return this.Impl.InsertBackgroundPicture(bordertype, path, embedded, filloption, watermark, effect, brightness, contrast, callback);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.InsertCtrl = function(ctrlid, initparam) {
    try {
        return this.Impl.InsertCtrl(ctrlid, initparam);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.InsertDocument = function(path, callback, callbackUserData) {
    try {
        return this.Impl.InsertDocument(path, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.LunarToSolar = function(nLunarYear, nLunarMonth, nLunarDay, bLeap) {
    try {
        return this.Impl.LunarToSolar(nLunarYear, nLunarMonth, nLunarDay, bLeap);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.LunarToSolarBySet = function(nLunarYear, nLunarMonth, nLunarDay,  bLeap) {
    try {
        return this.Impl.LunarToSolarBySet(nLunarYear, nLunarMonth, nLunarDay,  bLeap);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.SolarToLunar = function(nSolarYear, nSolarMonth, nSolarDay) {
    try {
        return this.Impl.SolarToLunar(nSolarYear, nSolarMonth, nSolarDay);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.SolarToLunarBySet = function(nSolarYear, nSolarMonth, nSolarDay) {
    try {
        return this.Impl.SolarToLunarBySet(nSolarYear, nSolarMonth, nSolarDay);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.ShowVerticalScroll = function (bShow) {
    try {
        this.Impl.ShowVerticalScroll(bShow);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.ShowHorizontalScroll = function (bShow) {
    try {
        this.Impl.ShowHorizontalScroll(bShow);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.LockCommand = function (aidStr, lock) {
    try {
        this.Impl.LockCommand(aidStr, lock);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.ModifyFieldProperties = function (field, remove, add) {
    try {
        return this.Impl.ModifyFieldProperties(field, remove, add);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.MovePos = function (moveID, para, pos) {
    try {
        return this.Impl.MovePos(moveID, para, pos);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.MoveToField = function (field, text, start, select) {
    try {
        return this.Impl.MoveToField(field, text, start, select);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.MoveToFieldEx = function (field, text, start, select) {
    try {
        return this.Impl.MoveToFieldEx(field, text, start, select);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.Open = function (path, format, arg, callback, callbackUserData) {
    try {
        return this.Impl.Open(path, format, arg, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.OpenDocument = function (path, format, callback) {
    try {
        return this.Impl.OpenDocument(path, format, callback);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.PrintDocument = function(){
    try {
        return this.Impl.PrintDocument();
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.RegisterModule = function() {
    try {
        this.Impl.RegisterModule();
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.ReleaseScan = function() {
    try {
        this.Impl.ReleaseScan();
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.RenameField = function (oldname, newname) {
    try {
        this.Impl.RenameField(oldname, newname);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.ReplaceAction = function (oldActionID, newActionID, userAction) {
    try {
        return this.Impl.ReplaceAction(oldActionID, newActionID, userAction);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.PutFieldText = function (fieldlist, textlist) {
    try {
        this.Impl.PutFieldText(fieldlist, textlist);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.Run = function (aidStr, callback, callbackUserData) {
    try {
        this.Impl.Run(aidStr, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

// 웹에서 지원 여부 확인 필요.
HwpCtrl.prototype.Save = function (save_if_dirty) {
    try {
        return this.Impl.Save(save_if_dirty);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SaveAs = function (fileName, format, arg, callback, callbackUserData) {
    try {
        return this.Impl.SaveAs(fileName, format, arg, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SaveDocument = function (fileName, format, callback) {
    try {
        return this.Impl.SaveDocument(fileName, format, callback);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SelectText = function (spara, spos, epara, epos) {
    try {
        return this.Impl.SelectText(spara, spos, epara, epos);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SetFieldViewOption = function(option){
    try {
        return this.Impl.SetFieldViewOption(option);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SetClientName = function(szClient){
    try {
        return this.Impl.SetClientName(szClient);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.SetCurFieldName = function (fieldname, option, direction, memo) {
    try {
        return this.Impl.SetCurFieldName(fieldname, option, direction, memo);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SetTextFile = function (data, format, option, callback, callbackUserData) {
    try {
        return this.Impl.SetTextFile(data, format, option, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SetPosBySet = function (pos) {
    try {
        return this.Impl.SetPosBySet(pos);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SetPos = function (list, para, pos) {
    try {
        return this.Impl.SetPos(list, para, pos);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.CreatePageImage = function (filename, pgno, format) {
    try {
        this.Impl.CreatePageImage(filename, pgno, format);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.CreatePageImageEx = function (filename, pgno, resolution, depth, format, option, callback, callbackUserData) {
    try {
        return this.Impl.CreatePageImageEx(filename, pgno, resolution, depth, format, option, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.IsEqualData = function (source, target, format) {
    try {
        return this.Impl.IsEqualData(source, target, format);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.GetActionCallbackMode = function (actionID) {
    try {
        return this.Impl.GetActionCallbackMode(actionID);
    } catch (e) {
        console.warn(e);
        return 0;
    }
};

HwpCtrl.prototype.ChangeIME = function(target){
    try {
        this.Impl.ChangeIME(target);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.FreeUndoHistory = function(){
    try {
        this.Impl.FreeUndoHistory();
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.SetClipboardFontCheckListener = function(listener){
    try {
        this.Impl.SetClipboardFontCheckListener(listener);
    } catch (e) {
        console.warn(e);
    }
};

HwpCtrl.prototype.CheckPossibleFont = function(fieldlist){
    try {
        return this.Impl.CheckPossibleFont(fieldlist);
    } catch (e) {
        console.warn(e);
        return 0;
    }
};

HwpCtrl.prototype.SetScrollElem = function(targetElem) {
    try {
        this.Impl.SetScrollElem(targetElem);
    } catch (e) {
        console.warn(e);
        return 0;
    }
};

HwpCtrl.prototype.SetPrivateInfoPassword = function(password) {
    try {
        return this.Impl.SetPrivateInfoPassword(password);
    } catch (e) {
        console.warn(e);
        return false;
    }
};
HwpCtrl.prototype.RegisterPrivateInfoPattern = function(PrivateType, PrivatePattern) {
    try {
        return this.Impl.RegisterPrivateInfoPattern(PrivateType, PrivatePattern);
    } catch (e) {
        console.warn(e);
        return false;
    }
};
HwpCtrl.prototype.FindPrivateInfo = function(PrivateType, PrivateString) {
    try {
        return this.Impl.FindPrivateInfo(PrivateType, PrivateString);
    } catch (e) {
        console.warn(e);
        return -1;
    }
};
HwpCtrl.prototype.ProtectPrivateInfo = function(ProtectingChar, PrivatePatternType, ProtectCtrlToTreatAsChar) {
    try {
        return this.Impl.ProtectPrivateInfo(ProtectingChar, PrivatePatternType, ProtectCtrlToTreatAsChar);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.IsValidFormat = function(option, callback, callbackUserData) {
    try {
        return this.Impl.IsValidFormat(option, callback, callbackUserData);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.SetMetaTag = function(name, format, value) {
    try {
        return this.Impl.SetMetaTag(name, format, value);
    } catch (e) {
        console.warn(e);
        return false;
    }
};

HwpCtrl.prototype.GetMetaTag = function(name) {
    try {
        return this.Impl.GetMetaTag(name);
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.GetMetaTagAll = function() {
    try {
        return this.Impl.GetMetaTagAll();
    } catch (e) {
        console.warn(e);
        return null;
    }
};

HwpCtrl.prototype.RemoveMetaTag = function(name) {
    try {
        this.Impl.RemoveMetaTag(name);
    } catch (e) {
        console.warn(e);
    }
};

function BuildWebHwpCtrl(id, baseurl, callback, storage) {
    try {
        window.HwpCtrlApp = window.HwpCtrlApp || HwpCtrlApp;
        window.ImageLoader = window.ImageLoader || ImageLoader;
        window.HwpCtrlApp.Initialize(id, baseurl, callback, storage);

        return new HwpCtrl(window.HwpCtrlApp, window.ImageLoader);
	} catch (e) {
        console.warn(e);
    }
}
