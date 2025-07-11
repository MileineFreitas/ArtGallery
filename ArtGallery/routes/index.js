// routes/index.js
const express = require("express");
const router = express.Router();
const {
   buscarInicioCategorias,
   buscarInicioObras,
   buscarUsuario,
   buscarObraAletoria,
   // importe aqui outras funções futuras...
} = require("../banco");

// Rota principal: exibe vários “itens” (categorias, produtos, etc.)
router.get("/", async (req, res) => {
   try {
      // busca de cada tipo
      const categorias = await buscarInicioCategorias();
      const obras = await buscarInicioObras();
      const obraArtDest = await buscarObraAletoria();
      // monte um array unificado de “itens”
      const itensC = [
         ...categorias.map((c) => ({
            id: c.id,
            nome: c.nome,
            foto: c.foto,
            tabela: "categoria",
         })),
      ];
      const itensO = [
         ...obras.map((o) => ({
            id: o.id,
            nome: o.nome,
            idArt: o.idArt,
            art: o.art,
            idUsuArt: o.idUsuArt,
            foto: o.foto,
            qfav: o.qfav,
            qcom: o.qcom,
            des: o.des,
            tabela: "obra",
         })),
      ];
      const itensOArtDest = obraArtDest
         ? [
              {
                 id: obraArtDest.id,
                 nome: obraArtDest.nome,
                 art: obraArtDest.art,
                 idArt: obraArtDest.idArt,
                 idUsuArt: obraArtDest.idUsuArt,
                 foto: obraArtDest.foto,
                 tabela: "obra",
              },
           ]
         : [];
      res.render("index", {
         title: "Página Inicial - ArtGallery",
         categorias: itensC,
         obras: itensO,
         obraArtDest: itensOArtDest,
      });
   } catch (erro) {
      console.error("Erro ao buscar dados:", erro);
      res.status(500).send("Erro ao carregar dados");
   }
});

// Rota de logout
router.get("/logout", (req, res) => {
   if (req.session.usuario) {
      req.session.destroy(() => res.redirect("/"));
   } else {
      res.redirect("/");
   }
});

module.exports = router;
