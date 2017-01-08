package dungeonfreak.engine.dungeon;


/*!
 *
 */
enum WallMaterial {
    Granite;                  //!< 花崗岩
    Vein(kind : VeinKind);    //!< 何らかの鉱脈
}

// Local Variables:
//   coding: utf-8
// End: