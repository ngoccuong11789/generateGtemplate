enum TabEnum { ALL, ONGOING, UPCOMING, EXPIRED, DELETED }

extension TabEnumlExt on TabEnum {
  static const _rawName = {
    TabEnum.ALL: "All",
    TabEnum.ONGOING: "Ongoing",
    TabEnum.UPCOMING: "Upcoming",
    TabEnum.EXPIRED: "Expired",
    TabEnum.DELETED: "Deactivate"
  };

  static const _rawCode = {
    TabEnum.ALL: "ALL",
    TabEnum.ONGOING: "ONGOING",
    TabEnum.UPCOMING: "UPCOMING",
    TabEnum.EXPIRED: "EXPIRED",
    TabEnum.DELETED: "DELETED"
  };

  String get name => _rawName[this]!;
  String get code => _rawCode[this]!;
}