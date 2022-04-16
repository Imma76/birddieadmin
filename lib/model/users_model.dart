class Users {
  String? name;
  String? location;
  String? imageUrl;
  String? videoUrl;
  String? age;
  String? dateOfBirth;
  String? gender;
  bool? isSubscribed;
  String? occupation;
  bool? underReview;
  bool? isVerified;

  Users(
      {this.age,
      this.dateOfBirth,
      this.gender,
      this.imageUrl,
      this.isSubscribed,
      this.isVerified,
      this.location ='',
      this.name,
      this.occupation,
      this.underReview,
      this.videoUrl});
}
