/*
   =========================
   @autor: Maciej Habasiński
   @nr_albumu: 152697
   =========================

  Ze względu na czytelność kodu, podane w poleceniu nazwy klas
  i ich metod zostały zmienione na język angielski
 */

#include <cstddef>
#include <iostream>
#include <string>
#include <typeinfo>

/*
   =============
   Pojazd Wodny
   =============
*/

class Vessel {
protected:
  std::string name = "";
  std::string production_year = "";
  bool is_loaded = false;

public:
  Vessel(const std::string &name, const std::string &production_year);
  virtual ~Vessel();
  virtual void info() const = 0;
  virtual void unload() = 0;
  virtual void load() = 0;

  std::string get_name() const;
  std::string get_production_year() const;
  bool get_is_loaded() const;
};

Vessel::Vessel(const std::string &name, const std::string &production_year)
    : name(name), production_year(production_year) {};

Vessel::~Vessel() {}
std::string Vessel::get_name() const { return this->name; }
std::string Vessel::get_production_year() const {
  return this->production_year;
}
bool Vessel::get_is_loaded() const { return this->is_loaded; }

/*
   =============
     SailingShip
   =============
*/

class SailingShip : public Vessel {
  unsigned int sail_count;
  bool are_sails_up;

public:
  SailingShip(const std::string &name, const std::string &production_year,
              unsigned int sail_count);
  ~SailingShip();

  void sails_up();
  void sails_down();

  void info() const override;
  void unload() override;
  void load() override;

  bool get_are_sails_up() const;
  unsigned int get_sail_count() const;
};

SailingShip::SailingShip(const std::string &name,
                         const std::string &production_year,
                         unsigned int sail_count)
    : Vessel(name, production_year), sail_count(sail_count) {
  this->are_sails_up = false;
}
SailingShip::~SailingShip() { std::cout << "Destruktor\n"; }

void SailingShip::load() {
  if (this->get_is_loaded()) {
    std::cout << "SailingShip już posiada ładunek\n";
    return;
  }
  this->is_loaded = true;
  std::cout << "SailingShip został załadowany\n";
}
void SailingShip::unload() {
  if (!this->get_is_loaded()) {
    std::cout << "SailingShip już został rozładowany\n";
    return;
  }
  this->is_loaded = false;
  std::cout << "SailingShip został rozładowany\n";
}
bool SailingShip::get_are_sails_up() const { return this->are_sails_up; }
unsigned int SailingShip::get_sail_count() const { return this->sail_count; }

void SailingShip::info() const {
  std::cout << "Żaglowiec\n";
  std::cout << "Nazwa: " << this->get_name() << "\n";
  std::cout << "Rok Produkcji: " << this->get_production_year() << "\n";
  std::cout << "Ilość Żagli: " << this->get_sail_count() << "\n";
  std::cout << "Stan Żagli: "
            << ((this->get_are_sails_up()) ? "Uniesione" : "Opuszczene")
            << "\n";
  std::cout << "Stan Ładunku: "
            << (this->get_is_loaded() ? "Załadowany" : "Rozładowany") << "\n";
}

void SailingShip::sails_up() {
  if (this->get_are_sails_up()) {
    std::cout << "Żagle już są uniesione";
    return;
  }
  this->are_sails_up = !this->get_are_sails_up();
  std::cout << "Żagle uniesione";
}
void SailingShip::sails_down() {
  if (!this->get_are_sails_up()) {
    std::cout << "Żagle już są opuszczone";
    return;
  }
  this->are_sails_up = this->get_are_sails_up();
  std::cout << "Żagle opuszczone";
}

/*
   =============
   Lodz Podwodna
   =============
*/

class Submarine : public Vessel {
  bool is_submerged = false;
  unsigned int torpedo_count = 0;

public:
  Submarine(const std::string &name, const std::string &production_year,
            unsigned int torpedo_count);

  bool get_is_submerged() const;
  unsigned int get_torpedo_count() const;

  void shoot();
  void surface();
  void submerge();

  void info() const override;
  void unload() override;
  void load() override;
};

Submarine::Submarine(const std::string &name,
                     const std::string &production_year,
                     unsigned int torpedo_count)
    : Vessel(name, production_year), torpedo_count(torpedo_count) {}

bool Submarine::get_is_submerged() const { return this->is_submerged; }
unsigned int Submarine::get_torpedo_count() const {
  return this->torpedo_count;
}

void Submarine::shoot() {
  if (this->get_torpedo_count() == 0) {
    std::cout << "Brak torped\n";
    return;
  }
  this->torpedo_count--;
  std::cout << "Wystrzelono torpedę\n";
}

void Submarine::surface() {
  if (!this->get_is_submerged()) {
    std::cout << "Łódź Podwodna nie jest zanurzona\n";
    return;
  }
  this->is_submerged = false;
  std::cout << "Łódź Podwodna wynurza się\n";
}

void Submarine::submerge() {
  if (this->get_is_submerged()) {
    std::cout << "Łódź Podwodna jest już zanurzona\n";
    return;
  }
  this->is_submerged = true;
  std::cout << "Łódź Podwodna zanurza się\n";
}

void Submarine::info() const {
  std::cout << "Łódź Podwodna\n";
  std::cout << "Nazwa: " << this->get_name() << "\n";
  std::cout << "Rok Produkcji: " << this->get_production_year() << "\n";
  std::cout << "Ilość Torped: " << this->get_torpedo_count() << "\n";
  std::cout << "Stan zanurzena: "
            << (this->get_is_submerged() ? "Zanurzony" : "Wynurzony") << "\n";
  std::cout << "Stan Ładunku: "
            << (this->get_is_loaded() ? "Załadowany" : "Rozładowany") << "\n";
}

void Submarine::load() {
  if (this->get_is_loaded()) {
    std::cout << "Łódź Podwodna już posiada ładunek\n";
    return;
  }
  this->is_loaded = true;
  std::cout << "Łódź Podwodna została załadowana\n";
}

void Submarine::unload() {
  if (!this->get_is_loaded()) {
    std::cout << "Łódź Podwodna już została rozładowana\n";
    return;
  }
  this->is_loaded = false;
  std::cout << "Łódź Podwodna została rozładowana\n";
}

/*
   =============
      Ship
   =============
*/

class Ship : public Vessel {
  bool is_anchored = false;

public:
  Ship(const std::string &name, const std::string &production_year);

  void anchor_down();
  void anchor_up();
  bool get_is_anchored() const;

  void info() const override;
  void unload() override;
  void load() override;
};

Ship::Ship(const std::string &name, const std::string &production_year)
    : Vessel(name, production_year) {}

void Ship::info() const {
  std::cout << "Statek\n";
  std::cout << "Nazwa: " << this->get_name() << "\n";
  std::cout << "Rok Produkcji: " << this->get_production_year() << "\n";
  std::cout << "Stan Kotwicy: "
            << (this->get_is_anchored() ? "Zanurzona" : "Wynurzona") << "\n";
  std::cout << "Stan Ładunku: "
            << (this->get_is_loaded() ? "Załadowany" : "Rozładowany") << "\n";
}

void Ship::load() {
  if (this->get_is_loaded()) {
    std::cout << "Ship już posiada ładunek\n";
    return;
  }
  this->is_loaded = true;
  std::cout << "Ship został załadowany\n";
}

void Ship::unload() {
  if (!this->get_is_loaded()) {
    std::cout << "Ship już został rozładowany\n";
    return;
  }
  this->is_loaded = false;
  std::cout << "Ship is unloaded\n";
}

void Ship::anchor_down() {
  if (this->get_is_anchored()) {
    std::cout << "Kotwica już jest opuszczona\n";
    return;
  }
  std::cout << "Kotwica została opuszczona\n";
  this->is_anchored = true;
}

void Ship::anchor_up() {
  if (!this->get_is_anchored()) {
    std::cout << "Kotwica już jest podniesiona\n";
    return;

    std::cout << "Kotwica została podniesiona\n";
    this->is_anchored = false;
  }
}

bool Ship::get_is_anchored() const { return this->is_anchored; }
/*
   =============
      Kapitan
   =============
*/

enum License {
  NONE,
  SHIP,
  SAILING_SHIP,
  SUBMARINE,
};

class Capitan {
  std::string first_name = "";
  std::string last_name = "";
  License license = License::NONE;
  Vessel *vessel = nullptr;

public:
  Capitan(const std::string &first_name, const std::string &last_name,
          License license);
  ~Capitan();

  void pilot_vessel(Vessel *vessel);
  // Ship
  void anchor_up();
  void anchor_down();
  // SailShip
  void sails_up();
  void sails_down();
  // Submarine
  void submerge();
  void surface();
  void shoot();
};

Capitan::Capitan(const std::string &first_name, const std::string &last_name,
                 License license)
    : first_name(first_name), last_name(last_name), license(license) {}

Capitan::~Capitan() {}

void Capitan::pilot_vessel(Vessel *vessel) {
  switch (this->license) {
  case SHIP:
    if (typeid(*vessel) != typeid(Ship))
      return;
    break;

  case SAILING_SHIP:
    if (typeid(*vessel) != typeid(SailingShip))
      return;
    break;

  case SUBMARINE:
    if (typeid(*vessel) != typeid(Submarine))
      return;
    break;
  default:
    return;
  }

  this->vessel = vessel;
}
// Ship
void Capitan::anchor_up() {
  if (this->license != SHIP)
    return;
  Ship *s = dynamic_cast<Ship *>(this->vessel);
  if (s)
    s->anchor_up();
}
void Capitan::anchor_down() {
  if (this->license != SHIP)
    return;
  Ship *s = dynamic_cast<Ship *>(this->vessel);
  if (s)
    s->anchor_down();
}
// SailShip
void Capitan::sails_up() {
  if (this->license != SAILING_SHIP)
    return;
  SailingShip *s = dynamic_cast<SailingShip *>(this->vessel);
  if (s)
    s->sails_up();
}
void Capitan::sails_down() {
  if (this->license != SAILING_SHIP && this->vessel != nullptr)
    return;
  SailingShip *s = dynamic_cast<SailingShip *>(this->vessel);
  if (s)
    s->sails_down();
}
// Submarine
void Capitan::submerge() {
  if (this->license != SUBMARINE && this->vessel != nullptr)
    return;
  Submarine *s = dynamic_cast<Submarine *>(this->vessel);
  if (s)
    s->submerge();
}
void Capitan::surface() {
  if (this->license != SUBMARINE && this->vessel != nullptr)
    return;
  Submarine *s = dynamic_cast<Submarine *>(this->vessel);
  if (s)
    s->surface();
}
void Capitan::shoot() {
  if (this->license != SUBMARINE && this->vessel != nullptr)
    return;
  Submarine *s = dynamic_cast<Submarine *>(this->vessel);
  if (s)
    s->shoot();
}

class Harbor {
private:
  Vessel *v = nullptr;

public:
  Harbor();
  ~Harbor();
  void vessel_arrive(Vessel *v);
  void vessel_depart(Vessel *v);
};

Harbor::Harbor() {}
Harbor::~Harbor() {}

void Harbor::vessel_arrive(Vessel *v) {
  if (this->v != nullptr)
    return;
  this->v = v;
}
void Harbor::vessel_depart(Vessel *v) {
  if (this->v == nullptr)
    return;
  v = this->v;
  this->v = nullptr;
}

int main(int argc, char *argv[]) {

  /*auto sailing_ship = SailingShip("Herman", "1851", 5);*/
  /*sailing_ship.load();*/
  /*sailing_ship.info();*/
  /*sailing_ship.unload();*/
  /*sailing_ship.sails_up();*/
  /*sailing_ship.info();*/
  /**/
  auto submarine = Submarine("Armstrong", "1944", 2);
  /*submarine.load();*/
  /*submarine.submerge();*/
  submarine.info();
  /*submarine.unload();*/
  /*submarine.surface();*/
  /*submarine.shoot();*/
  /*submarine.info();*/
  /**/
  /*auto ship = Ship("Dawnson", "1912");*/
  /*ship.load();*/
  /*ship.anchor_down();*/
  /*ship.info();*/
  /*ship.unload();*/
  /*ship.anchor_up();*/
  /*ship.info();*/

  auto capitan = Capitan("Adam", "Hermes", SUBMARINE);
  capitan.pilot_vessel(&submarine);
  capitan.shoot();

  submarine.info();
  return 0;
}
