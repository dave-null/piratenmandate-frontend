// from https://gist.github.com/emtiu/6098482

// Modified from fork origin:
// Adapted for use in https://github.com/dave-null/piratenmandate-frontend

// Usage:
//   var someButton = new L.Control.Button(options).addTo(map);
// This calls OnAdd(). See the code for what options are required
// The third parameter passed to L.DomEvent.addListener is the 'this' context
// to use in the callback (second parameter).

L.Control.Button = L.Control.extend({
  options: {
    position: mapSettings.extraButtonPosition
  },
  initialize: function (options) {
    this._button = {};
    this.setButton(options);
  },

  onAdd: function (map) {
    this._map = map;
    var container = L.DomUtil.create('div', 'leaflet-control-button');
	
    this._container = container;
    
    this._update();
    return this._container;
  },

  onRemove: function (map) {
  },

  setButton: function (options) {
    var button = {
      'text': options.text,                 //string
      'onClick': options.onClick,           //callback function
      'doToggle': options.toggle,			//bool
      'toggleStatus': false					//bool
    };

    this._button = button;
    this._update();
  },
  
  getText: function () {
  	return this._button.text;
  },
  
  destroy: function () {
  	this._button = {};
  	this._update();
  },
  
  toggle: function (e) {
  	if(typeof e === 'boolean'){
  		this._button.toggleStatus = e;
  	}
  	else{
  		this._button.toggleStatus = !this._button.toggleStatus;
  	}
  	this._update();
  },
  
  _update: function () {
    if (!this._map) {
      return;
    }

    this._container.innerHTML = '';
    this._makeButton(this._button);
 
  },

  _makeButton: function (button) {
    var newButton = L.DomUtil.create('div', 'leaflet-buttons-control-button', this._container);
    if(button.toggleStatus)
    	L.DomUtil.addClass(newButton,'leaflet-buttons-control-toggleon');
        
    if(button.text !== ''){

//       L.DomUtil.create('br','',newButton);  //there must be a better way

      var span = L.DomUtil.create('span', 'leaflet-buttons-control-text', newButton);
      var text = document.createTextNode(button.text);  //is there an L.DomUtil for this?
      span.appendChild(text);
    }

    L.DomEvent
      .addListener(newButton, 'click', L.DomEvent.stop)
      .addListener(newButton, 'click', button.onClick,this)
      .addListener(newButton, 'click', this._clicked,this);
    L.DomEvent.disableClickPropagation(newButton);
    return newButton;

  },
  
  _clicked: function () {  //'this' refers to button
  	if(this._button.doToggle){
  		if(this._button.toggleStatus) {	//currently true, remove class
  			L.DomUtil.removeClass(this._container.childNodes[0],'leaflet-buttons-control-toggleon');
  		}
  		else{
  			L.DomUtil.addClass(this._container.childNodes[0],'leaflet-buttons-control-toggleon');
  		}
  		this.toggle();
  	}
  	return;
  }

});