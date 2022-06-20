

class SearchProduct {
  SearchProduct({
      int? id, 
      Brand? brand, 
      String? image, 
      Charge? charge, 
      List<Images>? images, 
      String? slug, 
      String? productName, 
      String? model, 
      String? commissionType, 
      String? amount, 
      String? tag, 
      String? description, 
      String? note, 
      String? embaddedVideoLink, 
      int? maximumOrder, 
      int? stock, 
      bool? isBackOrder, 
      String? specification, 
      String? warranty, 
      bool? preOrder, 
      int? productReview, 
      bool? isSeller, 
      bool? isPhone, 
      bool? willShowEmi, 
      dynamic badge, 
      bool? isActive, 
      String? createdAt, 
      String? updatedAt, 
      dynamic language, 
      String? seller, 
      dynamic combo, 
      String? createdBy, 
      dynamic updatedBy, 
      List<int>? category, 
      List<dynamic>? relatedProduct, 
      List<dynamic>? filterValue,}){
    _id = id;
    _brand = brand;
    _image = image;
    _charge = charge;
    _images = images;
    _slug = slug;
    _productName = productName;
    _model = model;
    _commissionType = commissionType;
    _amount = amount;
    _tag = tag;
    _description = description;
    _note = note;
    _embaddedVideoLink = embaddedVideoLink;
    _maximumOrder = maximumOrder;
    _stock = stock;
    _isBackOrder = isBackOrder;
    _specification = specification;
    _warranty = warranty;
    _preOrder = preOrder;
    _productReview = productReview;
    _isSeller = isSeller;
    _isPhone = isPhone;
    _willShowEmi = willShowEmi;
    _badge = badge;
    _isActive = isActive;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _language = language;
    _seller = seller;
    _combo = combo;
    _createdBy = createdBy;
    _updatedBy = updatedBy;
    _category = category;
    _relatedProduct = relatedProduct;
    _filterValue = filterValue;
}

  SearchProduct.fromJson(dynamic json) {
    _id = json['id'] ==null?null: json['id'] as int?;
    _brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    _image = json['image']==null?null:json['image'] as String?;
    _charge = json['charge'] != null ? Charge.fromJson(json['charge']) : null;
    if (json['images'] != <Images>[]) {
      _images = <Images>[];
      json['images'].forEach((dynamic v) {
        _images?.add(Images.fromJson(v));
      });
    }else{
      _images = <Images>[];
    }
    _slug =json['slug'] ==null? null: json['slug'] as String?;
    // ignore: lines_longer_than_80_chars
    _productName = json['product_name'] ==null?null:  json['product_name'] as String?;
    _model =  json['model']==null? null:json['model'] as String?;
    // ignore: lines_longer_than_80_chars
    _commissionType =json['commission_type']==null?null: json['commission_type'] as String?;
    _amount = json['amount']==null?null:json['amount'] as String?;
    _tag =json['tag'] ==null?null: json['tag'] as String?;
    _description = json['description']==null?null:json['description'] as String?;
    _note = json['note']==null?null: json['note'] as String?;
    _embaddedVideoLink = json['embadded_video_link']==null?null: json['embadded_video_link'] as String?;
    _maximumOrder = json['maximum_order'] ==null?null:json['maximum_order'] as int?;
    _stock =json['stock']==null?null: json['stock'] as int?;
    _isBackOrder = json['is_back_order'] as bool?;
    _specification = json['specification']==null?null:json['specification'] as String?;
    _warranty =json['warranty'] ==null?null: json['warranty'] as String?;
    _preOrder = json['pre_order']==null?null:json['pre_order'] as bool?;
    _productReview =json['product_review']==null?null: json['product_review'] as int?;
    _isSeller =json['is_seller']==null?null: json['is_seller'] as bool?;
    _isPhone =json['is_phone'] ==null?null: json['is_phone'] as bool?;
    _willShowEmi =json['will_show_emi'] ==null?null :json['will_show_emi'] as bool?;
    _badge = json['badge']==null?null:json['badge'];
    _isActive = json['is_active']==null?null:json['is_active'] as bool?;
    _createdAt = json['created_at'] ==null?null:json['created_at'] as String?;
    _updatedAt = json['updated_at'] ==null?null:json['updated_at'] as String?;
    _language = json['language']==null?null:json['language'];
    _seller = json['seller']==null?null:json['seller'] as String?;
    _combo = json['combo']==null?null:json['combo'];
    _createdBy =json['created_by']==null?null: json['created_by'] as String?;
    _updatedBy =json['updated_by']==null?null: json['updated_by'] as String?;


  }
  int? _id;
  Brand? _brand;
  String? _image;
  Charge? _charge;
  List<Images>? _images;
  String? _slug;
  String? _productName;
  String? _model;
  String? _commissionType;
  String? _amount;
  String? _tag;
  String? _description;
  String? _note;
  String? _embaddedVideoLink;
  int? _maximumOrder;
  int? _stock;
  bool? _isBackOrder;
  String? _specification;
  String? _warranty;
  bool? _preOrder;
  int? _productReview;
  bool? _isSeller;
  bool? _isPhone;
  bool? _willShowEmi;
  dynamic _badge;
  bool? _isActive;
  String? _createdAt;
  String? _updatedAt;
  dynamic _language;
  String? _seller;
  dynamic _combo;
  String? _createdBy;
  dynamic _updatedBy;
  List<int>? _category;
  List<dynamic>? _relatedProduct;
  List<dynamic>? _filterValue;

  int? get id => _id;
  Brand? get brand => _brand;
  String? get image => _image;
  Charge? get charge => _charge;
  List<Images>? get images => _images;
  String? get slug => _slug;
  String? get productName => _productName;
  String? get model => _model;
  String? get commissionType => _commissionType;
  String? get amount => _amount;
  String? get tag => _tag;
  String? get description => _description;
  String? get note => _note;
  String? get embaddedVideoLink => _embaddedVideoLink;
  int? get maximumOrder => _maximumOrder;
  int? get stock => _stock;
  bool? get isBackOrder => _isBackOrder;
  String? get specification => _specification;
  String? get warranty => _warranty;
  bool? get preOrder => _preOrder;
  int? get productReview => _productReview;
  bool? get isSeller => _isSeller;
  bool? get isPhone => _isPhone;
  bool? get willShowEmi => _willShowEmi;
  dynamic get badge => _badge;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get language => _language;
  String? get seller => _seller;
  dynamic get combo => _combo;
  String? get createdBy => _createdBy;
  dynamic get updatedBy => _updatedBy;
  List<int>? get category => _category;
  List<dynamic>? get relatedProduct => _relatedProduct;
  List<dynamic>? get filterValue => _filterValue;



}


class Images {
  Images({
      int? id, 
      String? image, 
      bool? isPrimary, 
      int? product,}){
    _id = id;
    _image = image;
    _isPrimary = isPrimary;
    _product = product;
}

  Images.fromJson(dynamic json) {
    _id = json['id']==null?null:json['id']as int?;
    _image =json['image']==null?null: json['image']as String?;
    _isPrimary =json['is_primary']==null?null: json['is_primary']as bool?;
    _product =json['product']==null?null: json['product'] as int?;
  }
  int? _id;
  String? _image;
  bool? _isPrimary;
  int? _product;

  int? get id => _id;
  String? get image => _image;
  bool? get isPrimary => _isPrimary;
  int? get product => _product;



}


class Charge {
  Charge({
      double? bookingPrice, 
      double? currentCharge, 
      dynamic discountCharge, 
      double? sellingPrice, 
      double? profit, 
      bool? isEvent, 
      dynamic eventId, 
      bool? highlight, 
      dynamic highlightId, 
      bool? groupping, 
      dynamic grouppingId, 
      dynamic campaignSectionId, 
      bool? campaignSection, 
      dynamic message,}){
    _bookingPrice = bookingPrice;
    _currentCharge = currentCharge;
    _discountCharge = discountCharge;
    _sellingPrice = sellingPrice;
    _profit = profit;
    _isEvent = isEvent;
    _eventId = eventId;
    _highlight = highlight;
    _highlightId = highlightId;
    _groupping = groupping;
    _grouppingId = grouppingId;
    _campaignSectionId = campaignSectionId;
    _campaignSection = campaignSection;
    _message = message;
}

  Charge.fromJson(dynamic json) {
    _bookingPrice =json['booking_price'] ==null?null: json['booking_price'] as double?;
    _currentCharge = json['current_charge'] ==null?null:json['current_charge'] as double?;
    _discountCharge =json['discount_charge'] ==null?null: json['discount_charge'];
    _sellingPrice = json['selling_price'] ==null?null:json['selling_price'] as double?;
    _profit = json['profit'] ==null?null:json['profit']as double?;
    _isEvent =json['is_event'] ==null?null: json['is_event']as bool?;
    _eventId =json['event_id'] ==null?null: json['event_id'];
    _highlight =json['highlight'] ==null?null: json['highlight']as bool?;
    _highlightId =json['highlight_id'] ==null?null: json['highlight_id'];
    _groupping = json['groupping'] ==null?null:json['groupping']as bool?;
    _grouppingId =json['groupping_id'] ==null?null: json['groupping_id'];
    _campaignSectionId = json['campaign_section_id'] ==null?null:json['campaign_section_id'];
    _campaignSection =json['campaign_section'] ==null?null: json['campaign_section']as bool? ;
    _message = json['message'] ==null?null:json['message'];
  }
  double? _bookingPrice;
  double? _currentCharge;
  dynamic _discountCharge;
  double? _sellingPrice;
  double? _profit;
  bool? _isEvent;
  dynamic _eventId;
  bool? _highlight;
  dynamic _highlightId;
  bool? _groupping;
  dynamic _grouppingId;
  dynamic _campaignSectionId;
  bool? _campaignSection;
  dynamic _message;

  double? get bookingPrice => _bookingPrice;
  double? get currentCharge => _currentCharge;
  dynamic get discountCharge => _discountCharge;
  double? get sellingPrice => _sellingPrice;
  double? get profit => _profit;
  bool? get isEvent => _isEvent;
  dynamic get eventId => _eventId;
  bool? get highlight => _highlight;
  dynamic get highlightId => _highlightId;
  bool? get groupping => _groupping;
  dynamic get grouppingId => _grouppingId;
  dynamic get campaignSectionId => _campaignSectionId;
  bool? get campaignSection => _campaignSection;
  dynamic get message => _message;



}


class Brand {
  Brand({
      String? name, 
      String? image, 
      dynamic headerImage, 
      String? slug,}){
    _name = name;
    _image = image;
    _headerImage = headerImage;
    _slug = slug;
}

  Brand.fromJson(dynamic json) {
    _name = json['name']==null?null: json['name'] as String?;
    _image =json['image']==null?null:  json['image'] as String?;
    _headerImage =json['header_image']==null?null:  json['header_image'];
    _slug = json['slug']==null?null: json['slug'] as String?;
  }
  String? _name;
  String? _image;
  dynamic _headerImage;
  String? _slug;

  String? get name => _name;
  String? get image => _image;
  dynamic get headerImage => _headerImage;
  String? get slug => _slug;



}