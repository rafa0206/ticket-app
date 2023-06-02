class Ticket {
  int? userCustomerId;
  int? customerId;
  String subject;
  String description;
  String newUserEmail;
  String? processNameId;
  String? processAreaId;
  String? attachment;
  String? priority;
  String? status;

  Ticket({
    this.userCustomerId,
    this.customerId,
    required this.subject,
    required this.description,
    required this.newUserEmail,
    this.processNameId,
    this.processAreaId,
    this.attachment,
    this.priority,
    this.status,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      userCustomerId: 1560,
      customerId: (json['sent']['customer_id'] as num).toInt(),
      subject: (json['subject'] as String),
      description: (json['status_entity']['description'] as String),
      newUserEmail: (json['sent']['email'] as String),
      processNameId: (json['process_name_id']),
      processAreaId: (json['process_area_id']),
      priority: (json['priority_description'] as String),
      status: (json['status_entity']['title'] as String),
    );
  }

  factory Ticket.fromJsonOpenTicket(Map<String, dynamic> json) {
    return Ticket(
      userCustomerId: 1560,
      customerId: (json['customer_id'] as num).toInt(),
      subject: (json['subject'] as String),
      description: (json['description'] as String),
      processAreaId: (json['new_user_email'] as String),
      newUserEmail: (json['process_name_id'] as String),
      processNameId: (json['process_area_id'] as String),
      attachment: (json['attachment'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'usercustomer_id': userCustomerId,
      'customer_id': customerId,
      'subject': subject,
      'description': description,
      'new_user_email': newUserEmail,
      'process_name_id': processNameId,
      'process_area_id': processAreaId,
      'attachment': attachment,
    };
  }
}
