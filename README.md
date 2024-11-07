digraph BasicRegistration {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    registration_page [label="Visit Registration Page", style=filled, color="#FFEB3B", fontcolor="black", shape=box];
    enter_details [label="Enter Name, Email, Password", style=filled, color="#03A9F4", fontcolor="white", shape=box];
    validate_inputs [label="Validate Inputs", shape=diamond, color="#FF9800", fontcolor="black"];
    account_created [label="Account Created Successfully!", style=filled, color="#8BC34A", fontcolor="black", shape=box];
    invalid_input [label="Error: Invalid Input", style=filled, color="#F44336", fontcolor="white", shape=box];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    start -> registration_page -> enter_details -> validate_inputs;
    validate_inputs -> account_created [label="Valid", fontcolor="black"];
    validate_inputs -> invalid_input [label="Invalid", fontcolor="white"];
    account_created -> stop;
    invalid_input -> registration_page [label="Retry", fontcolor="black"];
}

digraph LoginFlow {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    login_page [label="Visit Login Page", style=filled, color="#FFEB3B", fontcolor="black", shape=box];
    enter_credentials [label="Enter Email and Password", style=filled, color="#03A9F4", fontcolor="white", shape=box];
    verify_credentials [label="Verify Credentials", shape=diamond, color="#FF9800", fontcolor="black"];
    login_success [label="Login Successful! JWT Generated", style=filled, color="#8BC34A", fontcolor="black", shape=box];
    login_error [label="Error: Invalid Email or Password", style=filled, color="#F44336", fontcolor="white", shape=box];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    start -> login_page -> enter_credentials -> verify_credentials;
    verify_credentials -> login_success [label="Valid", fontcolor="black"];
    verify_credentials -> login_error [label="Invalid", fontcolor="white"];
    login_success -> stop;
    login_error -> login_page [label="Retry", fontcolor="black"];
}

digraph AddDetailsFlow {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    check_authorization [label="Check Authorization\n(Token Validation)", shape=diamond, color="#FF9800", fontcolor="black"];
    authorization_failed [label="Access Denied: Invalid or Expired Token", style=filled, color="#F44336", fontcolor="white"];
    navigate_add_details [label="Navigate to 'Add Details' Section", style=filled, color="#FFEB3B", fontcolor="black", shape=box];
    enter_details [label="Enter Address, Education, Employment", style=filled, color="#03A9F4", fontcolor="white", shape=box];
    validate_details [label="Validate Input Fields", shape=diamond, color="#FF9800", fontcolor="black"];
    save_details [label="Details Added Successfully!", style=filled, color="#8BC34A", fontcolor="black", shape=box];
    invalid_details [label="Error: Invalid Input", style=filled, color="#F44336", fontcolor="white"];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    # Flow connections
    start -> check_authorization;
    check_authorization -> authorization_failed [label="Invalid Token", fontcolor="black"];
    check_authorization -> navigate_add_details [label="Valid Token", fontcolor="black"];
    authorization_failed -> stop;

    navigate_add_details -> enter_details -> validate_details;
    validate_details -> save_details [label="Valid", fontcolor="black"];
    validate_details -> invalid_details [label="Invalid", fontcolor="white"];
    save_details -> stop;
    invalid_details -> navigate_add_details [label="Retry", fontcolor="black"];
}


digraph UpdateProfileFlow {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    check_auth [label="Check Authorization (Valid Token)", style=filled, color="#FFEB3B", fontcolor="black"];
    verify_user_id [label="Verify User ID", style=filled, color="#FFEB3B", fontcolor="black"];
    navigate_edit_details [label="Navigate to 'Edit Details' Endpoint", style=filled, color="#FFEB3B", fontcolor="black"];
    enter_updates [label="Update Address, Education, Employment", style=filled, color="#03A9F4", fontcolor="white"];
    validate_updates [label="Validate Updated Details", shape=diamond, color="#FF9800", fontcolor="black"];
    updates_saved [label="Profile Updated Successfully!", style=filled, color="#8BC34A", fontcolor="black"];
    invalid_updates [label="Error: Invalid Input", style=filled, color="#F44336", fontcolor="white"];
    auth_failed [label="Access Denied: Invalid Token", style=filled, color="#F44336", fontcolor="white"];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    start -> check_auth;
    check_auth -> verify_user_id [label="Authorized", fontcolor="black"];
    check_auth -> auth_failed [label="Unauthorized", fontcolor="white"];
    verify_user_id -> navigate_edit_details;
    navigate_edit_details -> enter_updates -> validate_updates;
    validate_updates -> updates_saved [label="Valid", fontcolor="black"];
    validate_updates -> invalid_updates [label="Invalid", fontcolor="white"];
    updates_saved -> stop;
    invalid_updates -> navigate_edit_details [label="Retry", fontcolor="black"];
}

digraph ViewProfileFlow {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    check_auth [label="Check Authorization (Valid Token)", style=filled, color="#FFEB3B", fontcolor="black"];
    verify_user_id [label="Verify User ID", style=filled, color="#FFEB3B", fontcolor="black"];
    navigate_profile [label="Navigate to Profile Page", style=filled, color="#FFEB3B", fontcolor="black"];
    retrieve_profile [label="Retrieve Profile Information", style=filled, color="#03A9F4", fontcolor="white"];
    display_profile [label="Display Address, Education, Employment", style=filled, color="#03A9F4", fontcolor="white"];
    auth_failed [label="Access Denied: Invalid Token", style=filled, color="#F44336", fontcolor="white"];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    start -> check_auth;
    check_auth -> verify_user_id [label="Authorized", fontcolor="black"];
    check_auth -> auth_failed [label="Unauthorized", fontcolor="white"];
    verify_user_id -> navigate_profile -> retrieve_profile -> display_profile -> stop;
}

digraph LogoutFlow {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    check_auth [label="Check Authorization (Valid Token)", style=filled, color="#FFEB3B", fontcolor="black"];
    logout_button [label="Click 'Logout' Button", style=filled, color="#FFEB3B", fontcolor="black"];
    invalidate_token [label="Invalidate Authentication Token", style=filled, color="#FF9800", fontcolor="black"];
    logout_success [label="Logout Successful!", style=filled, color="#8BC34A", fontcolor="black"];
    auth_failed [label="Access Denied: Invalid Token", style=filled, color="#F44336", fontcolor="white"];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    start -> check_auth;
    check_auth -> logout_button [label="Authorized", fontcolor="black"];
    check_auth -> auth_failed [label="Unauthorized", fontcolor="white"];
    logout_button -> invalidate_token -> logout_success -> stop;
}

digraph ChangePasswordFlow {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    check_auth [label="Check Authorization (Valid Token)", style=filled, color="#FFEB3B", fontcolor="black"];
    verify_user_id [label="Verify User ID", style=filled, color="#FFEB3B", fontcolor="black"];
    navigate_change_password [label="Navigate to 'Change Password' Page", style=filled, color="#FFEB3B", fontcolor="black"];
    enter_new_password [label="Enter New Password", style=filled, color="#03A9F4", fontcolor="white"];
    confirm_new_password [label="Confirm New Password", style=filled, color="#03A9F4", fontcolor="white"];
    validate_password [label="Validate Passwords", shape=diamond, color="#FF9800", fontcolor="black"];
    password_changed [label="Password Changed Successfully!", style=filled, color="#8BC34A", fontcolor="black"];
    invalid_password [label="Error: Passwords Do Not Match", style=filled, color="#F44336", fontcolor="white"];
    auth_failed [label="Access Denied: Invalid Token", style=filled, color="#F44336", fontcolor="white"];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    start -> check_auth;
    check_auth -> verify_user_id [label="Authorized", fontcolor="black"];
    check_auth -> auth_failed [label="Unauthorized", fontcolor="white"];
    verify_user_id -> navigate_change_password -> enter_new_password -> confirm_new_password -> validate_password;
    validate_password -> password_changed [label="Match", fontcolor="black"];
    validate_password -> invalid_password [label="No Match", fontcolor="white"];
    password_changed -> stop;
    invalid_password -> navigate_change_password [label="Retry", fontcolor="black"];
}

digraph AuthorizationFlow {
    rankdir=LR;
    node [shape=box, style=rounded, color="#FFFFFF", fontname="Helvetica", fontsize=28, fontcolor="#333333", width=2.5, height=1.5];

    start [label="Start", shape=ellipse, style=filled, color="#4CAF50", fontcolor="white", fontsize=30];
    check_token [label="Check for Valid Authentication Token", style=filled, color="#FFEB3B", fontcolor="black"];
    validate_token [label="Validate Token", shape=diamond, color="#FF9800", fontcolor="black"];
    access_granted [label="Access Granted", style=filled, color="#8BC34A", fontcolor="black"];
    access_denied [label="Access Denied: Invalid or Expired Token", style=filled, color="#F44336", fontcolor="white"];
    stop [label="Stop", shape=ellipse, style=filled, color="#D32F2F", fontcolor="white", fontsize=30];

    start -> check_token -> validate_token;
    validate_token -> access_granted [label="Valid", fontcolor="black"];
    validate_token -> access_denied [label="Invalid or Expired", fontcolor="white"];
    access_granted -> stop;
    access_denied -> stop;
}
