package dungeonfreak.engine.dungeon;


/*!
 *
 */
enum TileType {
    Floor;                              //!< 床
    Wall(material : WallMaterial);      //!< 壁(壁の素材)
    Door(status : DoorStatus);          //!< ドア(開閉状態)
    Stairs(dir : DownOrUp);             //!< 階段(階段の向き)
}

// Local Variables:
//   coding: utf-8
// End: