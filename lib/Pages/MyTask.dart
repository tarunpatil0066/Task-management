import 'package:flutter/material.dart';
import '../Commonfiles/CommonPOP.dart';
import '../Commonfiles/Commonbutton.dart';
import '../Commonfiles/CommonTabBar.dart';
import '../Commonfiles/Commoncolor.dart';
import '../Commonfiles/Commondropdown.dart';
import 'homepage.dart'; // your common widget

class Mytask extends StatefulWidget {
  const Mytask({super.key});

  @override
  State<Mytask> createState() => _MytaskState();
}

class _MytaskState extends State<Mytask> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  bool today = false;
  bool tomorrow = false;
  bool cancel = false;
  bool save = false;

  //////////////////////Add task///////////////////////////
  void _showNewTaskDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CommonPopup(
              title: "New Task",
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Title *",
                      counterText: "",
                    ),
                    maxLength: 200,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: "Description",
                      counterText: "",
                    ),
                    maxLength: 500,
                    maxLines: 3,
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 8,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            today = true;
                            tomorrow = false;
                            // cancel = false;
                            // save = false;
                          });
                        },
                        child:  Text(
                            "Today",
                            style: TextStyle(
                                color:today? Colors.white: Colors.black
                            )),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: today ? Appcolor.Buttoncolor : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: today?Appcolor.Buttoncolor :Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            today = false;
                            tomorrow = true;
                            // cancel = false;
                            // save = false;
                          });
                        },
                        child:  Text("Tomorrow", style: TextStyle(
                            color: tomorrow? Colors.white:Colors.black
                        )),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: tomorrow ? Appcolor.Buttoncolor : Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color:tomorrow? Appcolor.Buttoncolor :Colors.black
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          _AssignTaskDialog(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                              Icons.person
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          _AssignTaskDialog(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                              Icons.people
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        child: Icon(
                            Icons.link
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          _AssignTarget(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[200],
                          child: Icon(
                              Icons.gps_fixed
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cancel = true;
                      save = false;
                    });
                    Navigator.pop(context);
                  },
                  child:  Text("Cancel", style: TextStyle(
                      color:cancel?Colors.white: Colors.black
                  )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cancel ? Appcolor.Buttoncolor : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color:cancel? Appcolor.Buttoncolor: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cancel = false;
                      save = true;
                    });
                    Navigator.pop(context);
                  },
                  child:  Text("Save",
                      style: TextStyle(
                          color: save? Colors.white: Colors.black
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: save ? Appcolor.Buttoncolor : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color:save? Appcolor.Buttoncolor:Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  //////////////////////////////////////////////
  /////////// assign task ///////////
  void _AssignTaskDialog(BuildContext context) {
    final List<String> allUsers = [
      "Tarun",
      "Rahul",
      "Priya",
      "Ankit",
      "Sneha",
      "Kiran",
      "Ravi"
    ];
    List<String> filteredUsers = List.from(allUsers);
    Set<String> selectedUsers = {};
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CommonPopup(
              title: "Assign Task",
              content: SizedBox(
                height: 400, // 👈 give fixed height (or MediaQuery height * 0.5)
                width: double.maxFinite,
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const CommonTabBar(
                        tabs: [
                          Tab(text: "Users"),
                          Tab(text: "CC"),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10,),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: TextField(
                                    decoration: const InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText: "Search by name",
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.black,
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        filteredUsers = allUsers
                                            .where((user) => user
                                            .toLowerCase()
                                            .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: filteredUsers.length,
                                    itemBuilder: (context, index) {
                                      final user = filteredUsers[index];
                                      final isSelected =
                                      selectedUsers.contains(user);

                                      return CheckboxListTile(
                                        title: Text(user),
                                        value: isSelected,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            if (value == true) {
                                              selectedUsers.add(user);
                                            } else {
                                              selectedUsers.remove(user);
                                            }
                                          });
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Center(child: Text("Second Screen")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cancel = true;
                      save = false;
                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      color: cancel ? Colors.white : Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    cancel ? Appcolor.Buttoncolor : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: cancel ? Appcolor.Buttoncolor : Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cancel = false;
                      save = true;
                    });
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: save ? Colors.white : Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: save ? Appcolor.Buttoncolor : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: save ? Appcolor.Buttoncolor : Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  ////////////////assign target///////////////////
  void _AssignTarget(BuildContext context) {
    final List<String> allUsers = [
      "Tarun",
      "Rahul",
      "Priya",
      "Ankit",
      "Sneha",
      "Kiran",
      "Ravi"
    ];
    List<String> filteredUsers = List.from(allUsers);

    // 👇 store target values for each employee
    Map<String, String> userTargets = {};

    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CommonPopup(
              title: "Assign Target",
              content: SizedBox(
                height: 400,
                width: double.maxFinite,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search by name",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            filteredUsers = allUsers
                                .where((user) => user
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                                .toList();
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredUsers.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers[index];
                          return ListTile(
                            title: Text(user),
                            trailing: SizedBox(
                              width: 100,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: "Enter Target",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    userTargets[user] = value; // save target
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print("Assigned Targets: $userTargets"); // 👈 here you get employee -> target map
                    Navigator.pop(context);
                  },
                  child: const Text("Save", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Appcolor.Buttoncolor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
  //////////////////////filter///////////////////////
  String? selectmember;
  String? selecttasktype;
  String? selectdate;
  String? selectduedate;
  DateTime? fromDate;
  DateTime? toDate;
  void _FilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) {
            return CommonPopup(
              title: "Filter",
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonDropdown(
                      items: ["Tarun patil", "Adarsh", "Wasim"],
                      value: selectmember,
                      hintText: "By member",
                      onChanged: (val) {
                        setState(() {
                          selectmember = val;
                        });
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please select member";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    CommonDropdown(
                      items: ["Recurring", "Non Recurring", "Target"],
                      value: selecttasktype,
                      hintText: "By Task Type",
                      onChanged: (val) {
                        setState(() {
                          selecttasktype = val;
                        });
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please select Task Type";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    CommonDropdown(
                      items: ["Create Date", "Modified Date"],
                      value: selectdate,
                      hintText: "Select date",
                      onChanged: (val) {
                        setState(() {
                          selectdate = val;
                        });
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please select date";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: fromDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            fromDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(fromDate == null
                                ? "From Date"
                                : "${fromDate!.day}/${fromDate!.month}/${fromDate!.year}"),
                            const Icon(Icons.calendar_today, size: 18),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: toDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            toDate = picked;
                          });
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(toDate == null
                                ? "To Date"
                                : "${toDate!.day}/${toDate!.month}/${toDate!.year}"),
                            const Icon(Icons.calendar_today, size: 18),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    CommonDropdown(
                      items: ["Today", "Tomorrow", "This Week","Over Due","No Due Date"],
                      value: selectduedate,
                      hintText: "By Due date",
                      onChanged: (val) {
                        setState(() {
                          selectduedate = val;
                        });
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please select by Due date";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cancel = true;
                      save = false;
                    });
                    Navigator.pop(context);
                  },
                  child:  Text("Cancel", style: TextStyle(
                      color:cancel?Colors.white: Colors.black
                  )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cancel ? Appcolor.Buttoncolor : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color:cancel? Appcolor.Buttoncolor: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cancel = false;
                      save = true;
                    });
                    Navigator.pop(context);
                  },
                  child:  Text("Save",
                      style: TextStyle(
                          color: save? Colors.white: Colors.black
                      )),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: save ? Appcolor.Buttoncolor : Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color:save? Appcolor.Buttoncolor:Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
  ///////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    final screenheight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Text(
          "Task",
          style: TextStyle(
              color: Colors.white
          ),
        ),
        leading: IconButton(
            onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>Homepage())
              );
            },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
        ),
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Center(
                  child: Container(
                    width: screenwidth*0.25,
                    decoration: BoxDecoration(
                        color: Appcolor.Buttoncolor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
                      child: Center(child: Text("Filter", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),
              // PopupMenuItem 2
              PopupMenuItem(
                value: 2,
                child: Center(
                  child: Container(
                    width: screenwidth*0.25,
                    decoration: BoxDecoration(
                        color: Appcolor.Buttoncolor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,bottom: 10,right: 20,left: 20),
                      child: Center(child: Text("Add Task", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                    ),
                  ),
                ),
              ),
            ],
            offset: const Offset(0, 100),
            color: Colors.white,
            iconColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Appcolor.Buttoncolor)
            ),
            elevation: 2,
            // on selected we show the dialog box
            onSelected: (value) {
              // if value 1 show dialog
              if (value == 1) {
                _FilterDialog(context);
              } else if (value == 2) {
                _showNewTaskDialog(context);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: screenheight * 0.02),
          CommonTabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: "My Task",),
              Tab(text: "Assigned By Me"),
              Tab(text: "CC",),
              Tab(text: "Starred",),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Center(child: Text("First Screen")),  // replace with FirstScreen()
                Center(child: Text("Second Screen")), // replace with SecondScreen()
                Center(child: Text("Third Screen")),  // replace with ThirdScreen()
                Center(child: Text("Fourth Screen")), // replace with FourthScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
