/// Role the invitee will receive after redeeming an invitation.
enum InviteTargetRole { parent, child, friend }

InviteTargetRole? parseInviteTargetRole(String? value) => switch (value) {
  'parent' => InviteTargetRole.parent,
  'child' => InviteTargetRole.child,
  'friend' => InviteTargetRole.friend,
  _ => null,
};

String inviteTargetRoleToTransport(InviteTargetRole role) => switch (role) {
  InviteTargetRole.parent => 'parent',
  InviteTargetRole.child => 'child',
  InviteTargetRole.friend => 'friend',
};
