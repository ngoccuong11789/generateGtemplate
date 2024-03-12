class Reviews {
  Reviews({
      this.value, 
      this.average, 
      this.countReview,});

  Reviews.fromJson(dynamic json) {
    value = json['value'];
    average = json['average'];
    countReview = json['count_review'];
  }
  num? value;
  num? average;
  num? countReview;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['average'] = average;
    map['count_review'] = countReview;
    return map;
  }

}