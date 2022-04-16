const rootRoute = "/";

const matchPage = "Match";
const matchPageRoutes = "/match";

const verificationPage = "verification";
const verificationPageRoute = "/verification";

const eventsPage = "Events";
const eventsPageRoute = "/events";

// const authenticationPageDisplayName = "Log out";
// const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(matchPage, matchPageRoutes),
 MenuItem(verificationPage, verificationPageRoute),
 MenuItem(eventsPage, eventsPageRoute),
 //MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];