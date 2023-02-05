class rendeom {
  String gender;
  String name;
  String city;
  String state;
  String country;
  String email;
  String date;
  int age;
  String phone;
  String cell;
  String medium;

  rendeom(
      {required this.gender,
      required this.name,
      required this.city,
      required this.state,
      required this.country,
      required this.email,
      required this.date,
      required this.age,
      required this.phone,
      required this.cell,
      required this.medium
      });

  factory rendeom.fromjson({required Map data}) {
    return rendeom(
        gender: data["results"][0]["gender"],
        name:
            "${data["results"][0]["name"]["title"]} ${data["results"][0]["name"]["first"]} ${data["results"][0]["name"]["last"]}",
        city: data["results"][0]["location"]["city"],
        state: data["results"][0]["location"]["state"],
        country: data["results"][0]["location"]["country"],
        email: data["results"][0]["email"],
        date: data["results"][0]["dob"]["date"],
        age: data["results"][0]["dob"]["age"],
        phone: data["results"][0]["phone"],
        cell: data["results"][0]["cell"],
        medium: data["results"][0]["picture"]["large"]
        );
  }
}
