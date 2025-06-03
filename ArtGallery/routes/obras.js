// routes/obras.js (ou onde preferir agrupar)
const express = require("express");
const router = express.Router();
const {
  jaFavoritou, // bool  -> usuário já marcou?
  favoritarObraComDesbloqueio, // void  -> grava favorito
  desfavoritarObra, // void  -> remove favorito
  contarFavoritos, // int   -> total atual
  buscarUmaObra,
  buscarComentariosPorObra,
} = require("../banco");

router.get("/", async (req, res) => {
  if (!req.session.usuario) {
    return res.redirect("/login");
  }

  try {
    const usuario = req.session.usuario.id;
    const obras = await contarFavoritos(usuario);

    res.render("obras", { obras, usuario });
  } catch (err) {
    console.error("Erro ao carregar obras:", err);
    res.status(500).send("Erro ao carregar obras");
  }
});

router.get("/:id", async (req, res) => {
  if (!req.session.usuario) {
    return res.redirect("/login");
  }
  const obraId = req.params.id.includes("=")
    ? req.params.id.split("=")[1]
    : req.params.id;
  const usuario = req.session.usuario.id;
  try {
    const obra = await buscarUmaObra(obraId);
    const jaFavoritouObra = await jaFavoritou(usuario, obraId);
    const comentarios = await buscarComentariosPorObra(obraId); // Supondo que você tenha uma função para buscar comentários

    if (!obra) {
      return res.status(404).send("Obra não encontrada");
    }
    res.render("ObraID", { 
        obra: {
            id: obra.id, 
            titulo: obra.titulo,
            id_art: obra.id_art, 
            artU: obra.artU,
            artC: obra.artC,
            foto: obra.foto, 
            des: obra.des, 
            qcom: obra.qcom,
            qfav: obra.qfav,
            tabela: "obra"
        },
        title: `Obra: ${obra.titulo} – ArtGallery`,
        jaFavoritou: jaFavoritouObra, 
        comentarios: comentarios.map(c => ({
            id_com: c.id_com,
            id_usu: c.id_usu,
            id_obr: c.id_obr,
            texto_com: c.texto_com,
            tabela: "comentario"
        })),
        usuario: req.session.usuario, 
    });
  } catch (err) {
    console.error("Erro ao carregar detalhes da obra:", err);
    res.status(500).send("Erro ao carregar detalhes da obra");
  }
});

router.get(":id/favoritar/:id", async (req, res) => {
  if (!req.session.usuario){
    return res.redirect("/login");
  }
  const obraId = req.params.id.includes("=")
    ? req.params.id.split("=")[1]
    : req.params.id;
  const usuario = req.session.usuario.id;
  const obra = await buscarUmaObra(obraId);
  const jaFavoritouObra = await jaFavoritou(usuario, obraId);
  try{

  } catch (erro){

  }
});

/*
router.get("/favoritar/:id", async (req, res) => {
  if (!req.session.usuario) {
    return res.redirect("/login");
  }
  const usuId = req.session.usuario;
  const obraId = req.params.id.includes("=")
    ? req.params.id.split("=")[1]
    : req.params.id;

  // --- BLOQUEIO de 5s ---
  const agora = Date.now();
  const ultimoClique = req.session.ultimoFav?.[obraId] || 0;

  if (agora - ultimoClique < 5000) {
    console.log("Clique bloqueado por 5s");
    return res.redirect(req.get("Referrer") || "/");
  }

  // Atualiza a marca de tempo
  req.session.ultimoFav = {
    ...(req.session.ultimoFav || {}),
    [obraId]: agora,
  };

  try {
    // Alterna favorito ↔ desfavorito
    if (await jaFavoritou(usuId, obraId)) {
      await desfavoritarObra(usuId, obraId);
    } else {
      await favoritarObraComDesbloqueio(usuId, obraId);
    }
    console.log("Favoreitou");
    res.redirect(req.get("Referrer") || "/");
  } catch (err) {
    console.error("Erro ao favoritar:", err);
    res.status(500).send("Erro ao favoritar obra");
  }
});
*/

/*
router.get('/favoritar', async (req, res) => {
  if (!req.session.usuario) {
    return res.redirect('/login');
  }
  const obraId = req.params.id;
  try {
    const usuario = req.session.usuario.id;
    const obra = await buscarUmaObraDetalhada(ObraId, usuario);
    const favorito = await jaFavoritou(usuario, ObraId);
    if (jaFavoritou > 0){
      await favoritarObra(usuario, obraId);

    } else {
      await desfavoritarObra(usuario, obraId);
     
    }

    res.send({
      sucesso: true,
      mensagem: "Favoritos atualizados com sucesso",
      obra,
      favorito
    });
  } catch (err) {
    res.send({
      sucesso: false,
      mensagem
    })
  }
  res.redirect('/obras');
});
*/

router.get("/comentar/:id", async (req, res) => {
  if (!req.session.usuario) {
    return res.redirect("/login");
  }

  const obraId = req.params.id.includes("=")
    ? req.params.id.split("=")[1]
    : req.params.id;
  const usuario = req.session.usuario.id;

  // --- BLOQUEIO de 5s ---
  const agora = Date.now();
  const ultimoClique = req.session.ultimoCom?.[obraId] || 0;

  if (agora - ultimoClique < 5000) {
    console.log("Clique bloqueado por 5s");
    return res.redirect("back", {usuario: req.session.usuario || null}); // volta para a mesma página
  }

  // Atualiza a marca de tempo
  req.session.ultimoCom = {
    ...(req.session.ultimoCom || {}),
    [obraId]: agora,
  };

  try {
    // Aqui você deve implementar a lógica para comentar a obra
    // Exemplo: await comentar(usuario, obraId, req.body.comentario);

    res.redirect("back"); // volta para a página anterior
  } catch (err) {
    console.error("Erro ao comentar:", err);
    res.status(500).send("Erro ao comentar obra");
  }
});

router.get("/colecionar/:id", async (req, res) => {
  if (!req.session.usuario) {
    return res.redirect("/login");
  }

  const obraId = req.params.id.includes("=")
    ? req.params.id.split("=")[1]
    : req.params.id;
  const usuario = req.session.usuario.id;

  // --- BLOQUEIO de 5s ---
  const agora = Date.now();
  const ultimoClique = req.session.ultimoCol?.[obraId] || 0;

  if (agora - ultimoClique < 5000) {
    console.log("Clique bloqueado por 5s");
    return res.redirect("back", {usuario: req.session.usuario || null}); // volta para a mesma página
  }

  // Atualiza a marca de tempo
  req.session.ultimoCol = {
    ...(req.session.ultimoCol || {}),
    [obraId]: agora,
  };

  try {
    // Aqui você deve implementar a lógica para colecionar a obra
    // Exemplo: await colecionar(usuario, obraId);

    res.redirect("back", {usuario: req.session.usuario || null}); // volta para a página anterior
  } catch (err) {
    console.error("Erro ao colecionar:", err);
    res.status(500).send("Erro ao colecionar obra");
  }
});

module.exports = router;