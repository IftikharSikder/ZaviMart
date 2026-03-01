class ProfileModel {
  final Profile profile;
  final List<ProfileSection> sections;

  ProfileModel({required this.profile, required this.sections});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      profile: Profile.fromJson(json['profile']),
      sections: (json['sections'] as List).map((e) => ProfileSection.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'profile': profile.toJson(), 'sections': sections.map((e) => e.toJson()).toList()};
  }
}

class Profile {
  final String name;
  final int wishlist;
  final int followedStores;
  final int vouchers;

  Profile({
    required this.name,
    required this.wishlist,
    required this.followedStores,
    required this.vouchers,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      wishlist: json['wishlist'],
      followedStores: json['followedStores'],
      vouchers: json['vouchers'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'wishlist': wishlist,
      'followedStores': followedStores,
      'vouchers': vouchers,
    };
  }
}

class ProfileSection {
  final String title;
  final List<SettingsItemModel> items;

  ProfileSection({required this.title, required this.items});

  factory ProfileSection.fromJson(Map<String, dynamic> json) {
    return ProfileSection(
      title: json['title'],
      items: (json['items'] as List).map((e) => SettingsItemModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'title': title, 'items': items.map((e) => e.toJson()).toList()};
  }
}

class SettingsItemModel {
  final String label;
  final String? value;
  final bool isLast;

  SettingsItemModel({required this.label, this.value, this.isLast = false});

  factory SettingsItemModel.fromJson(Map<String, dynamic> json) {
    return SettingsItemModel(
      label: json['label'],
      value: json['value'],
      isLast: json['isLast'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'label': label, 'value': value, 'isLast': isLast};
  }
}
