// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Or Continue with`
  String get orContinueWith {
    return Intl.message(
      'Or Continue with',
      name: 'orContinueWith',
      desc: '',
      args: [],
    );
  }

  /// `Enter Phone Number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter Phone Number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Google`
  String get google {
    return Intl.message(
      'Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message(
      'Full Name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Full Name`
  String get enterFullName {
    return Intl.message(
      'Enter Full Name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter Email Address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter Email Address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `We'll send OTP on above given number.`
  String get wellSendOtp {
    return Intl.message(
      'We\'ll send OTP on above given number.',
      name: 'wellSendOtp',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Add 6 digit verification code sent on your given phone number.`
  String get add6DigitVerificationCode {
    return Intl.message(
      'Add 6 digit verification code sent on your given phone number.',
      name: 'add6DigitVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Verification Code`
  String get verificationCode {
    return Intl.message(
      'Verification Code',
      name: 'verificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter Verification Code`
  String get enterVerificationCode {
    return Intl.message(
      'Enter Verification Code',
      name: 'enterVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Select Country`
  String get selectCountry {
    return Intl.message(
      'Select Country',
      name: 'selectCountry',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `FAQs`
  String get faqs {
    return Intl.message(
      'FAQs',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `How to upload NFTs?`
  String get howToUploadNfts {
    return Intl.message(
      'How to upload NFTs?',
      name: 'howToUploadNfts',
      desc: '',
      args: [],
    );
  }

  /// `How to connect wallet?`
  String get howToConnectWallet {
    return Intl.message(
      'How to connect wallet?',
      name: 'howToConnectWallet',
      desc: '',
      args: [],
    );
  }

  /// `How to disconnect wallet?`
  String get howToDisconnectWallet {
    return Intl.message(
      'How to disconnect wallet?',
      name: 'howToDisconnectWallet',
      desc: '',
      args: [],
    );
  }

  /// `How to change language?`
  String get howToChangeLanguage {
    return Intl.message(
      'How to change language?',
      name: 'howToChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `How to make collection?`
  String get howToMakeCollection {
    return Intl.message(
      'How to make collection?',
      name: 'howToMakeCollection',
      desc: '',
      args: [],
    );
  }

  /// `What is NFT Wallet?`
  String get whatIsNftWallet {
    return Intl.message(
      'What is NFT Wallet?',
      name: 'whatIsNftWallet',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Use`
  String get termsOfUse {
    return Intl.message(
      'Terms of Use',
      name: 'termsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Change language`
  String get changeLanguage {
    return Intl.message(
      'Change language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Connect us for any feedback or query.`
  String get connectUsForAnyFeedbackOrQuery {
    return Intl.message(
      'Connect us for any feedback or query.',
      name: 'connectUsForAnyFeedbackOrQuery',
      desc: '',
      args: [],
    );
  }

  /// `Call us`
  String get callUs {
    return Intl.message(
      'Call us',
      name: 'callUs',
      desc: '',
      args: [],
    );
  }

  /// `Email us`
  String get emailUs {
    return Intl.message(
      'Email us',
      name: 'emailUs',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message`
  String get enterYourMessage {
    return Intl.message(
      'Enter your message',
      name: 'enterYourMessage',
      desc: '',
      args: [],
    );
  }

  /// `Or write to us`
  String get orWriteToUs {
    return Intl.message(
      'Or write to us',
      name: 'orWriteToUs',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Art`
  String get art {
    return Intl.message(
      'Art',
      name: 'art',
      desc: '',
      args: [],
    );
  }

  /// `Gaming`
  String get gaming {
    return Intl.message(
      'Gaming',
      name: 'gaming',
      desc: '',
      args: [],
    );
  }

  /// `Videos`
  String get videos {
    return Intl.message(
      'Videos',
      name: 'videos',
      desc: '',
      args: [],
    );
  }

  /// `Illustration`
  String get illustration {
    return Intl.message(
      'Illustration',
      name: 'illustration',
      desc: '',
      args: [],
    );
  }

  /// `Music`
  String get music {
    return Intl.message(
      'Music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `3D`
  String get threeD {
    return Intl.message(
      '3D',
      name: 'threeD',
      desc: '',
      args: [],
    );
  }

  /// `Live Auctions`
  String get liveAuctions {
    return Intl.message(
      'Live Auctions',
      name: 'liveAuctions',
      desc: '',
      args: [],
    );
  }

  /// `Latest`
  String get latest {
    return Intl.message(
      'Latest',
      name: 'latest',
      desc: '',
      args: [],
    );
  }

  /// `Highest Bid`
  String get highestBid {
    return Intl.message(
      'Highest Bid',
      name: 'highestBid',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get following {
    return Intl.message(
      'Following',
      name: 'following',
      desc: '',
      args: [],
    );
  }

  /// `Search NFT, Sellers`
  String get searchNftSellers {
    return Intl.message(
      'Search NFT, Sellers',
      name: 'searchNftSellers',
      desc: '',
      args: [],
    );
  }

  /// `Sellers`
  String get sellers {
    return Intl.message(
      'Sellers',
      name: 'sellers',
      desc: '',
      args: [],
    );
  }

  /// `Follow`
  String get follow {
    return Intl.message(
      'Follow',
      name: 'follow',
      desc: '',
      args: [],
    );
  }

  /// `Place a Bid`
  String get placeABid {
    return Intl.message(
      'Place a Bid',
      name: 'placeABid',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get owner {
    return Intl.message(
      'Owner',
      name: 'owner',
      desc: '',
      args: [],
    );
  }

  /// `Bid History`
  String get bidHistory {
    return Intl.message(
      'Bid History',
      name: 'bidHistory',
      desc: '',
      args: [],
    );
  }

  /// `bid with`
  String get bidWith {
    return Intl.message(
      'bid with',
      name: 'bidWith',
      desc: '',
      args: [],
    );
  }

  /// `Liked !`
  String get liked {
    return Intl.message(
      'Liked !',
      name: 'liked',
      desc: '',
      args: [],
    );
  }

  /// `Save to Collection`
  String get saveToCollection {
    return Intl.message(
      'Save to Collection',
      name: 'saveToCollection',
      desc: '',
      args: [],
    );
  }

  /// `Last Highest Bid`
  String get lastHighestBid {
    return Intl.message(
      'Last Highest Bid',
      name: 'lastHighestBid',
      desc: '',
      args: [],
    );
  }

  /// `You are about to place a bid for`
  String get youAreAboutToPlaceABidFor {
    return Intl.message(
      'You are about to place a bid for',
      name: 'youAreAboutToPlaceABidFor',
      desc: '',
      args: [],
    );
  }

  /// `by`
  String get by {
    return Intl.message(
      'by',
      name: 'by',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Enter bid amount`
  String get enterBidAmount {
    return Intl.message(
      'Enter bid amount',
      name: 'enterBidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Service Fee`
  String get serviceFee {
    return Intl.message(
      'Service Fee',
      name: 'serviceFee',
      desc: '',
      args: [],
    );
  }

  /// `Total bid amount`
  String get totalBidAmount {
    return Intl.message(
      'Total bid amount',
      name: 'totalBidAmount',
      desc: '',
      args: [],
    );
  }

  /// `Your balance`
  String get yourBalance {
    return Intl.message(
      'Your balance',
      name: 'yourBalance',
      desc: '',
      args: [],
    );
  }

  /// `Connect Wallet`
  String get connectWallet {
    return Intl.message(
      'Connect Wallet',
      name: 'connectWallet',
      desc: '',
      args: [],
    );
  }

  /// `Choose your wallet`
  String get chooseYourWallet {
    return Intl.message(
      'Choose your wallet',
      name: 'chooseYourWallet',
      desc: '',
      args: [],
    );
  }

  /// `By connecting your wallet, you're agreed to our terms and conditions`
  String get byVonnectingYourWallet {
    return Intl.message(
      'By connecting your wallet, you\'re agreed to our terms and conditions',
      name: 'byVonnectingYourWallet',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get wallet {
    return Intl.message(
      'Wallet',
      name: 'wallet',
      desc: '',
      args: [],
    );
  }

  /// `Recent Activities`
  String get recentActivities {
    return Intl.message(
      'Recent Activities',
      name: 'recentActivities',
      desc: '',
      args: [],
    );
  }

  /// `Received from`
  String get receivedFrom {
    return Intl.message(
      'Received from',
      name: 'receivedFrom',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Recently Searched`
  String get recentlySearched {
    return Intl.message(
      'Recently Searched',
      name: 'recentlySearched',
      desc: '',
      args: [],
    );
  }

  /// `NFT Categories`
  String get nftCategories {
    return Intl.message(
      'NFT Categories',
      name: 'nftCategories',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `added`
  String get added {
    return Intl.message(
      'added',
      name: 'added',
      desc: '',
      args: [],
    );
  }

  /// `ETH Received`
  String get ethReceived {
    return Intl.message(
      'ETH Received',
      name: 'ethReceived',
      desc: '',
      args: [],
    );
  }

  /// `My Balance`
  String get myBalance {
    return Intl.message(
      'My Balance',
      name: 'myBalance',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get followers {
    return Intl.message(
      'Followers',
      name: 'followers',
      desc: '',
      args: [],
    );
  }

  /// `All Items`
  String get allItems {
    return Intl.message(
      'All Items',
      name: 'allItems',
      desc: '',
      args: [],
    );
  }

  /// `Minted`
  String get minted {
    return Intl.message(
      'Minted',
      name: 'minted',
      desc: '',
      args: [],
    );
  }

  /// `Showing`
  String get showing {
    return Intl.message(
      'Showing',
      name: 'showing',
      desc: '',
      args: [],
    );
  }

  /// `items`
  String get items {
    return Intl.message(
      'items',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Create Item`
  String get createItem {
    return Intl.message(
      'Create Item',
      name: 'createItem',
      desc: '',
      args: [],
    );
  }

  /// `Upload File`
  String get uploadFile {
    return Intl.message(
      'Upload File',
      name: 'uploadFile',
      desc: '',
      args: [],
    );
  }

  /// `Add NFT Info`
  String get addNftInfo {
    return Intl.message(
      'Add NFT Info',
      name: 'addNftInfo',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get title {
    return Intl.message(
      'Title',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Enter NFT title`
  String get enterNftTitle {
    return Intl.message(
      'Enter NFT title',
      name: 'enterNftTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select NFT Type`
  String get selectNftType {
    return Intl.message(
      'Select NFT Type',
      name: 'selectNftType',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Enter Description`
  String get enterDescription {
    return Intl.message(
      'Enter Description',
      name: 'enterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Set Price`
  String get setPrice {
    return Intl.message(
      'Set Price',
      name: 'setPrice',
      desc: '',
      args: [],
    );
  }

  /// `Fixed Price`
  String get fixedPrice {
    return Intl.message(
      'Fixed Price',
      name: 'fixedPrice',
      desc: '',
      args: [],
    );
  }

  /// `Auction`
  String get auction {
    return Intl.message(
      'Auction',
      name: 'auction',
      desc: '',
      args: [],
    );
  }

  /// `Collections`
  String get collections {
    return Intl.message(
      'Collections',
      name: 'collections',
      desc: '',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: '',
      args: [],
    );
  }

  /// `Enter Price`
  String get enterPrice {
    return Intl.message(
      'Enter Price',
      name: 'enterPrice',
      desc: '',
      args: [],
    );
  }

  /// `You will receive`
  String get youWillReceive {
    return Intl.message(
      'You will receive',
      name: 'youWillReceive',
      desc: '',
      args: [],
    );
  }

  /// `Publish`
  String get publish {
    return Intl.message(
      'Publish',
      name: 'publish',
      desc: '',
      args: [],
    );
  }

  /// `Starting Date`
  String get startingDate {
    return Intl.message(
      'Starting Date',
      name: 'startingDate',
      desc: '',
      args: [],
    );
  }

  /// `Expiration Date`
  String get expirationDate {
    return Intl.message(
      'Expiration Date',
      name: 'expirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `10 days`
  String get tenDays {
    return Intl.message(
      '10 days',
      name: 'tenDays',
      desc: '',
      args: [],
    );
  }

  /// `Upload Another`
  String get uploadAnother {
    return Intl.message(
      'Upload Another',
      name: 'uploadAnother',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Your NFT Link`
  String get yourNftLink {
    return Intl.message(
      'Your NFT Link',
      name: 'yourNftLink',
      desc: '',
      args: [],
    );
  }

  /// `Published`
  String get published {
    return Intl.message(
      'Published',
      name: 'published',
      desc: '',
      args: [],
    );
  }

  /// `Fine Arts`
  String get fineArts {
    return Intl.message(
      'Fine Arts',
      name: 'fineArts',
      desc: '',
      args: [],
    );
  }

  /// `Paintings`
  String get paintings {
    return Intl.message(
      'Paintings',
      name: 'paintings',
      desc: '',
      args: [],
    );
  }

  /// `Landscapes`
  String get landscapes {
    return Intl.message(
      'Landscapes',
      name: 'landscapes',
      desc: '',
      args: [],
    );
  }

  /// `Add New`
  String get addNew {
    return Intl.message(
      'Add New',
      name: 'addNew',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Give a name to your collection`
  String get giveANameToYourCollection {
    return Intl.message(
      'Give a name to your collection',
      name: 'giveANameToYourCollection',
      desc: '',
      args: [],
    );
  }

  /// `Enter Collection Name`
  String get enterCollectionName {
    return Intl.message(
      'Enter Collection Name',
      name: 'enterCollectionName',
      desc: '',
      args: [],
    );
  }

  /// `Create Collection`
  String get createCollection {
    return Intl.message(
      'Create Collection',
      name: 'createCollection',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Sold to`
  String get soldTo {
    return Intl.message(
      'Sold to',
      name: 'soldTo',
      desc: '',
      args: [],
    );
  }

  /// `In wallet via`
  String get inWalletVia {
    return Intl.message(
      'In wallet via',
      name: 'inWalletVia',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Apple`
  String get apple {
    return Intl.message(
      'Apple',
      name: 'apple',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Enter Password`
  String get enterPassword {
    return Intl.message(
      'Enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'tr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
