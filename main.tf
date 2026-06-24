module "rg" {
  source = "./modules/resourcegroup"
  rgname = local.rgfullname

}
/*
module "ASP" {
  source   = "./modules/appserviceplan"
  rgname   = module.rg.rgname
  location = module.rg.location
}
module "database" {
  source   = "./modules/database"  
  rgname   = module.rg.rgname
  location = module.rg.location
}
*/