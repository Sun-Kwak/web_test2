
import 'package:form_validator/form_validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:web_test2/screen/member/controller/member_input_state.dart';
import 'package:authentication_repository/src/members_repository.dart';

final memberInputProvider =
    StateNotifierProvider.autoDispose<MemberInputController, MemberInputState>(
  (ref) => MemberInputController(ref.watch(memberRepositoryProvider), ref.watch(memberEditingProvider)),
);

class MemberInputController extends StateNotifier<MemberInputState> {
  final MemberRepository _memberRepository;
  final MemberEditingProvider memberEditingProvider;



  MemberInputController(this._memberRepository, this.memberEditingProvider)
      : super(const MemberInputState());

  void onNameChange(String value) {
    final name = Name.dirty(value);

    state = state.copyWith(
        name: name,
        status: Formz.validate([
          name,
          state.date,
          state.phone,
        ]),
    );
  }

  void onDateChange(String value) {
    final date = Date.dirty(value);
    state = state.copyWith(
      date: date,
      status: Formz.validate([
        date,
        state.name,
        state.phone,
      ]),
    );
  }

  void onPhoneChange(String value) async {
    final phone = Phone.dirty(value);
    state = state.copyWith(
      phone: phone,
      status: Formz.validate([
        phone,
        state.name,
        state.date,
      ]),
    );
  }


  void resetAll() {
    const name = Name.pure();
    const date = Date.pure();
    const phone = Phone.pure();
    state = state.copyWith(
      name: name,
      date: date,
      phone: phone,
      status: Formz.validate([
        phone,
        date,
        name,
      ]),
    );
  }

  void recall(Member member) {
    var name = Name.dirty(member.displayName);
    var phone = Phone.dirty(member.phoneNumber);
    var date = Date.dirty(member.birthDay);
    // final selectedMember = member;
    state = state.copyWith(
      name: name,
      date: date,
      phone: phone,
      status: Formz.validate([
        phone,
        date,
        name,
      ]),
    );

  }

  void addMember(Member member, MembersProvider membersProvider) async {
    // if (memberEditingProvider.isEditing == true){
    //
    // }
      if (!state.status.isValidated) return;
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      Member newMember = member.copyWith(
        displayName: state.name.value,
        gender: member.gender,
        birthDay: state.date.value,
        phoneNumber: state.phone.value,
        address: member.address,
        signUpPath: member.signUpPath,
        referralID: member.referralID,
        referralName: member.referralName,
        // accountLinkID: member.accountLinkID,
        memo: member.memo,
      );
      state = state.copyWith(status: FormzStatus.submissionSuccess);
      resetAll();


      if (memberEditingProvider.isEditing == true) {
        await _memberRepository.updateMember(newMember);
      } else {
        newMember = newMember.copyWith(
          createdAt: DateTime.now()
        );
        await _memberRepository.addMember(newMember);
      }
      membersProvider.getMembers();

    } on MemberAddFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.code);
    }
  }
}
