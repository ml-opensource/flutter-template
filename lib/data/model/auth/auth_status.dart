
enum AuthStatus {
	/// Authentication required.
	unknown,

	/// Authenticated user available.
	ok,

	/// Email verification pending.
	verification,

	/// Authentication token expired.
	expired,
}