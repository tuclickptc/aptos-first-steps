module introduccion::practica_aptos {
    use std::debug::print;
    use std::string::utf8;

    fun practica() {

        let aptos_logo = b"MMMMMMMMMMMMMMMMWKkdc;'..          ..';cdkKWMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMWXkl,.                        .,lkXWMMMMMMMMMMMM\nMMMMMMMMMMXk:.                                .ckXMMMMMMMMMM\nMMMMMMMWKo'                               ...    'oKWMMMMMMM\nMMMMMMXo.                               .:OX0l.    .oXMMMMMM\nMMMMMNd;;;,;;,,,,,,,,,,,,,,,,,,,;;;,,,;lOWMMMW0l;,;;:dXMMMMM\nMMMMMWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWMMMMMMMMMWWWWWWWMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNKXWMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNx,.'oXMMMMMMMMMMMMMMMMMMMM\nN0kkkkkkkkkkkkkkkkkkkkkkkkkkkkkko,     'okkkkkkkkkkkkkkkkk0N\nx.                                                        .x\n;                              .;;.                        ;\n.                           .cx0WW0c.                      .\nolllllllllllllllllllllllllld0WMMMMMW0olllllllllllllllllllllo\nMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMMMXkkXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMMMMXd'  'xXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nkoollloolllllllllollc'      'clllllllllllllllllllllllllllllx\nl                                                          c\n0'                 .cl;                                   '0\nWx.              .oKWMNk,                                .xW\nMW0xxxxxxxxxxxxxkXWMMMMMNOkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk0WM\nMMMMMMMMMMMMWWWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMMMMXd;,l0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM\nMMMMMMMWKd,    .lOKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKKXWMMMMMMM\nMMMMMMMNx'        ................................;kNMMMMMMM\nMMMMMMMMWKd,.                                  .,dKWMMMMMMMM\nMMMMMMMMMMMN0o,.                            .,o0NMMMMMMMMMMM\nMMMMMMMMMMMMMMWKxl;..                  ..;lxKWMMMMMMMMMMMMMM\nMMMMMMMMMMMMMMMMMMWKko:'.          .';okKWMMMMMMMMMMMMMMMMMM\n";

        print(&utf8(aptos_logo));
    }

    #[test]
    fun prueba() {
       practica();
    }
}
